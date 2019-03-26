library(dafs)


### Name: shadeDens
### Title: Add a shaded region to a pdf plot
### Aliases: shadeDens
### Keywords: hplot

### ** Examples

x = seq(-4.5,4.5,by = 0.01)
plot(x, dnorm(x), type = 'l')
x0 = qnorm(0.975)
x1 = 4.5
shadeDens(x0, x1, dnorm)



