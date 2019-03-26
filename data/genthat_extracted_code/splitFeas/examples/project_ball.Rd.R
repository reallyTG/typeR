library(splitFeas)


### Name: project_ball
### Title: Projection onto a ball
### Aliases: project_ball

### ** Examples

set.seed(12345)
p <- 3
center <- rnorm(p)
r <- runif(1)
x <- rnorm(p)
y <- project_ball(x,center,r)



