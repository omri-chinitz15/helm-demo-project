{{/* service name */}}
{{- define "myservice.name" -}}
{{ .Values.service_name }}
{{- end }}

{{/*service envs*/}}
{{- define "myservice.envs" -}}
{{- with .Values.env }}
env:
  {{- range $key, $val := . }}
  - name: {{ $key }}
    value: {{ $val | quote }}
  {{- end }}
{{- end }}
{{- end }}

{{/*image fullname*/}}
{{- define "image.fullname" -}}
docker.io/library/{{ .Values.global.namespace }}-{{ include "myservice.name" . }}:{{ .Values.image_tag | default "latest" }} 
{{- end }}


