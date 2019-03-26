library(Zelig)


### Name: Zelig-poisson-class
### Title: Poisson Regression for Event Count Dependent Variables
### Aliases: Zelig-poisson-class zpoisson

### ** Examples

library(Zelig)
data(sanction)
z.out <- zelig(num ~ target + coop, model = "poisson", data = sanction)
summary(z.out)




