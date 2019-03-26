library(IceCast)


### Name: makePolygons
### Title: Create polygon from mapped points
### Aliases: makePolygons

### ** Examples

newPoly <- makePolygons(myEnd = mappedPoints, myFixedLine = regionInfo$lines[[1]],
                        myOut = regionInfo$out[[1]])
plot(newPoly)



