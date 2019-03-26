library(rgl)


### Name: setUserShaders
### Title: Set user-defined shaders for 'rgl' objects.
### Aliases: setUserShaders

### ** Examples

id <- shade3d(octahedron3d(), col = "red")

# For each triangle, set weights on the 3 vertices.
# This will be replicated to the appropriate size in Javascript.
wts <- diag(3)

# This leaves out the centres of each face
vs <- "
  attribute vec3 aPos;
  attribute vec4 aCol;
  uniform mat4 mvMatrix;
  uniform mat4 prMatrix;
  varying vec4 vCol;
  varying vec4 vPosition;
  attribute vec3 aNorm;
  uniform mat4 normMatrix;
  varying vec3 vNormal;
  attribute vec3 wts;
  varying vec3 vwts;
  void main(void) {
    vPosition = mvMatrix * vec4(aPos, 1.);
    gl_Position = prMatrix * vPosition;
    vCol = aCol;
    vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
    vwts = wts;
  }
"  
fs <- "
  #ifdef GL_ES
  precision highp float;
  #endif
  varying vec4 vCol; // carries alpha
  varying vec4 vPosition;
  varying vec3 vNormal;
  uniform mat4 mvMatrix;
  uniform vec3 emission;
  uniform float shininess;
  uniform vec3 ambient0;
  uniform vec3 specular0; // light*material
  uniform vec3 diffuse0;
  uniform vec3 lightDir0;
  uniform bool viewpoint0;
  uniform bool finite0;
  varying vec3 vwts;
  uniform vec2 wtrange;
  void main(void) {
    float minwt = min(vwts.x, min(vwts.y, vwts.z));
    if (minwt < wtrange.x || minwt > wtrange.y) discard;
    vec3 eye = normalize(-vPosition.xyz);
    vec3 lightdir;
    vec4 colDiff;
    vec3 halfVec;
    vec4 lighteffect = vec4(emission, 0.);
    vec3 col;
    float nDotL;
    vec3 n = normalize(vNormal);
    n = -faceforward(n, n, eye);
    colDiff = vec4(vCol.rgb * diffuse0, vCol.a);
    lightdir = lightDir0;
    if (!viewpoint0)
      lightdir = (mvMatrix * vec4(lightdir, 1.)).xyz;
    if (!finite0) {
      halfVec = normalize(lightdir + eye);
    } else {
      lightdir = normalize(lightdir - vPosition.xyz);
      halfVec = normalize(lightdir + eye);
    }
    col = ambient0;
    nDotL = dot(n, lightdir);
    col = col + max(nDotL, 0.) * colDiff.rgb;
    col = col + pow(max(dot(halfVec, n), 0.), shininess) * specular0;
    lighteffect = lighteffect + vec4(col, colDiff.a);
    gl_FragColor = lighteffect;
  }
"
x <- setUserShaders(id, vs, fs, attributes = list(wts=wts),
                    uniforms = list(wtrange = c(-0.01, 0.15)))
if (interactive())
  rglwidget(x)



