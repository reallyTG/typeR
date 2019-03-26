library(shapes)


### Name: apes
### Title: Great ape data
### Aliases: apes
### Keywords: datasets

### ** Examples

data(apes)
par(mfrow=c(1,2))
plotshapes(apes$x[,,apes$group=="gorf"],symbol="f")
plotshapes(apes$x[,,apes$group=="gorm"],symbol="m")



