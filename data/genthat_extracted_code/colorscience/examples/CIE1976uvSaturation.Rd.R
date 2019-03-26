library(colorscience)


### Name: CIE1976uvSaturation
### Title: CIE 1976 uv Saturation
### Aliases: CIE1976uvSaturation
### Keywords: datasets

### ** Examples

CIE1976uvSaturation(cbind(34.78467, 28.15159, 3.024663), as.numeric(
get("XYZperfectreflectingdiffuser", 
envir = environment())[which(get("XYZperfectreflectingdiffuser", 
envir = environment())[["Illuminant"]]=='C'),c('X2','Y2')]))



