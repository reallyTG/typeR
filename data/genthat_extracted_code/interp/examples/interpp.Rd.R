library(interp)


### Name: interpp
### Title: Pointwise interpolate irregular gridded data
### Aliases: interpp
### Keywords: spatial

### ** Examples

### Use all datasets from Franke, 1979:
### calculate z at shifted original locations.
data(franke)
for(i in 1:5)
    for(j in 1:3){
        FR <- franke.data(i,j,franke)
        IL <- with(FR, interpp(x,y,z,x+0.1,y+0.1,linear=TRUE))
        str(IL)
    }



