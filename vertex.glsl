precision mediump float;

attribute vec3 vPosition;
attribute vec3 vColor;
attribute vec3 vNormal;
varying vec3 fColor;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 perspectiveMatrix;

uniform vec3 lightColor;
uniform vec3 lightDirection;

void main() {
  gl_Position = perspectiveMatrix * viewMatrix * modelMatrix * vec4(vPosition, 1.0);

  vec3 normal = normalize(vNormal); //supaya jadi unit vektor

//perkalian titik (dot product) antara vektor arah datang cahaya dengan orientasi permukaan (vektor normal)
  float lightIntensity = max(dot(lightDirection, normal), 0.0);

//menghitung nilai diffuse dari interaksi cahaya dan material
  vec3 diffuse = lightColor * vColor.rgb *lightIntensity;

  fColor = diffuse;
}
