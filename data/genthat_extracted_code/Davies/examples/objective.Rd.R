library(Davies)


### Name: objective
### Title: The objective function for fitting the Davies distribution
### Aliases: objective objective.approx
### Keywords: distribution

### ** Examples

params <- c(10, 0.1, 0.1)
x <- rdavies(100,params)
objective(params,x)
objective.approx(params,x)

objective(least.squares(x),x)
objective(davies.start(x),x)
  


