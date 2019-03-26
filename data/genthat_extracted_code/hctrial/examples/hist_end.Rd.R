library(hctrial)


### Name: hist_end
### Title: Adjust a design based on historical controls at the end of the
###   study using the covariate data of the patients accrued in stage 2.
### Aliases: hist_end

### ** Examples

X <- abs(rnorm(1000, 0, 1))
Y <- rbinom(1000, 1, 1-exp(-X))
mydata <- data.frame("X" = X, "Y" = Y)
start <- hist_start(mydata, Y~X, c1 = 2)
n1 <- start$des_start[2]
X1 <- abs(rnorm(n1, 0, 1))
dataone <- data.frame("X" = X1)
interim <- hist_interim(start, dataone)
n2 <- interim$des_interim[4]
X2 <- abs(rnorm(n2, 0, 1))
datatwo <- data.frame("X" = X2)
hist_end(interim, datatwo)



