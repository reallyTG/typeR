library(emplik)


### Name: emplikH.disc
### Title: Empirical likelihood ratio for discrete hazard with right
###   censored, left truncated data
### Aliases: emplikH.disc
### Keywords: nonparametric survival htest

### ** Examples

fun4 <- function(x, theta) { as.numeric(x <= theta) }
x <- c(1, 2, 3, 4, 5, 6, 5, 4, 3, 4, 1, 2.4, 4.5)
d <- c(1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1)
# test if -H(4) = -0.7 
emplikH.disc(x=x,d=d,K=-0.7,fun=fun4,theta=4)
# we should get "-2LLR" 0.1446316  etc....
y <- c(-2,-2, -2, 1.5, -1)
emplikH.disc(x=x,d=d,y=y,K=-0.7,fun=fun4,theta=4)



