library(hctrial)


### Name: hist_interim
### Title: Adjust a design based on historical controls at interim using
###   the covariate data of the patients accrued in stage 1.
### Aliases: hist_interim

### ** Examples

X <- abs(rnorm(1000, 0, 1))
Y <- rbinom(1000, 1, 1-exp(-X))
mydata <- data.frame("X" = X, "Y" = Y)
start <- hist_start(mydata, Y~X, c1 = 2)
n1 <- start$des_start[2]
X1 <- abs(rnorm(n1, 0, 1))
dataone <- data.frame("X" = X1)
hist_interim(start, dataone)



