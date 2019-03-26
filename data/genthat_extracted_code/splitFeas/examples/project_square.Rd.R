library(splitFeas)


### Name: project_square
### Title: Project onto a square
### Aliases: project_square

### ** Examples

set.seed(12345)
p <- 2
center <- matrix(rnorm(p),p,1)
r <- runif(1)
x <- matrix(rnorm(p),p,1)
y <- project_square(x,center,r)



