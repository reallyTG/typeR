library(Zelig)


### Name: Zelig-gamma-gee-class
### Title: Generalized Estimating Equation for Gamma Regression
### Aliases: Zelig-gamma-gee-class zgammagee

### ** Examples

library(Zelig)
data(coalition)
coalition$cluster <- c(rep(c(1:62), 5),rep(c(63), 4))
sorted.coalition <- coalition[order(coalition$cluster),]
z.out <- zelig(duration ~ fract + numst2, model = "gamma.gee",id = "cluster",
               data = sorted.coalition,corstr = "exchangeable")
summary(z.out)




