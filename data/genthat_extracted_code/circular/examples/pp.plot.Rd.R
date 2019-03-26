library(circular)


### Name: pp.plot
### Title: von Mises Probability-Probability Plot
### Aliases: pp.plot
### Keywords: hplot

### ** Examples

x <- rvonmises(n=25, mu=circular(0), kappa=3)
pp.plot(x)
x <- c(rvonmises(n=20, mu=circular(0), kappa=7), 
  rvonmises(n=20, mu=circular(pi), kappa=7))
pp.plot(x)



