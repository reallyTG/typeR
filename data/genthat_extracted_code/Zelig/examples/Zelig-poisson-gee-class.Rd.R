library(Zelig)


### Name: Zelig-poisson-gee-class
### Title: Generalized Estimating Equation for Poisson Regression
### Aliases: Zelig-poisson-gee-class zpoissongee

### ** Examples

library(Zelig)
data(sanction)
sanction$cluster <- c(rep(c(1:15), 5), rep(c(16), 3))
sorted.sanction <- sanction[order(sanction$cluster),]
z.out <- zelig(num ~ target + coop, model = "poisson.gee",id = "cluster", data = sorted.sanction)
summary(z.out)




