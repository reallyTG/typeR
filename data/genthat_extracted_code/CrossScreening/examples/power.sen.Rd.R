library(CrossScreening)


### Name: power.sen
### Title: Power of sensitivity analysis
### Aliases: power.sen

### ** Examples


power.sen(d = rnorm(100) + 0.5, I = 200, gamma = 2)

## The following code reproduces an example of power analysis in Zhao (2017)
power.sen(0.76, sqrt(0.26), gamma = 2.5, I = 200)
power.sen(0.76, sqrt(0.26), gamma = 2.5, I = 200, approx.method = "fixed.alpha")




