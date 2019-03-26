library(lspartition)


### Name: lsprobust.plot
### Title: Graphic Presentation of Results for 'lspartition' Package
### Aliases: lsprobust.plot

### ** Examples

x   <- runif(500)
y   <- sin(4*x)+rnorm(500)
est <- lsprobust(y, x)
lsprobust.plot(est)




