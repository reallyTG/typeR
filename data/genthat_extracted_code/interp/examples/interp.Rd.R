library(interp)


### Name: interp
### Title: Interpolation function
### Aliases: interp
### Keywords: dplot math

### ** Examples

### Use all datasets from Franke, 1979:
data(franke)
for(i in 1:5)
    for(j in 1:3){
        FR <- franke.data(i,j,franke)
        IL <- with(FR, interp(x,y,z,method="linear"))
        image(IL)
        contour(IL,add=TRUE)
        with(FR,points(x,y))
    }



