library(dMod)


### Name: Xt
### Title: Generate a prediction function that returns times
### Aliases: Xt

### ** Examples

x <- Xt()
g <- Y(c(y = "a*time^2+b"), f = NULL, parameters = c("a", "b"))

times <- seq(-1, 1, by = .05)
pars <- c(a = .1, b = 1)

plot((g*x)(times, pars))



