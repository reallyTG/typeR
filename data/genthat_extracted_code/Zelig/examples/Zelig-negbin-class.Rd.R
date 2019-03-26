library(Zelig)


### Name: Zelig-negbin-class
### Title: Negative Binomial Regression for Event Count Dependent Variables
### Aliases: Zelig-negbin-class znegbin

### ** Examples

library(Zelig)
data(sanction)
z.out <- zelig(num ~ target + coop, model = "negbin", data = sanction)
summary(z.out)




