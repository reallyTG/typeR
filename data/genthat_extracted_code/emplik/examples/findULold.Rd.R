library(emplik)


### Name: findULold
### Title: Find the Wilks Confidence Interval from the Given (empirical)
###   Likelihood Ratio Function
### Aliases: findULold
### Keywords: nonparametric htest

### ** Examples

## example with tied observations. Kaplan-Meier mean=4.0659.
## For more examples see vignettes.
x <- c(1, 1.5, 2, 3, 4, 5, 6, 5, 4, 1, 2, 4.5)
d <- c(1,   1, 0, 1, 0, 1, 1, 1, 1, 0, 0,  1)
myfun6 <- function(theta, x, d) {
el.cen.EM2(x, d, fun=function(t){t}, mu=theta)
}
findULold(step=0.2, fun=myfun6, MLE=4.0659, level = qchisq(0.9, df=1) , x=x, d=d)



