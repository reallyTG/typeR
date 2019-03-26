library(colocalization)


### Name: twolines
### Title: A simulated 2-lines test data in 3D
### Aliases: twolines

### ** Examples

data("twolines")

## No test: 
library(rgl)
plot3d(twolines[,c("x","y","z")], type = 's', size = 0.8, col = twolines$membership)
aspect3d("iso")
## End(No test)



