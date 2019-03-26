library(Zelig)


### Name: Zelig-weibull-class
### Title: Weibull Regression for Duration Dependent Variables
### Aliases: Zelig-weibull-class zweibull

### ** Examples

data(coalition)
z.out <- zelig(Surv(duration, ciep12) ~ fract + numst2,model = "weibull", data = coalition)




