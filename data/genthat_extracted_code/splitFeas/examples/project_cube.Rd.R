library(splitFeas)


### Name: project_cube
### Title: Project onto a cube
### Aliases: project_cube

### ** Examples

set.seed(12345)
p <- 3
center <- matrix(rnorm(p),p,1)
r <- runif(1)
x <- matrix(rnorm(p),p,1)
y <- project_cube(x,center,r)



