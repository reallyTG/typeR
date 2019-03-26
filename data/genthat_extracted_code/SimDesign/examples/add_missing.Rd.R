library(SimDesign)


### Name: add_missing
### Title: Add missing values to a vector given a MCAR, MAR, or MNAR scheme
### Aliases: add_missing

### ** Examples


set.seed(1)
y <- rnorm(1000)

## 10% missing rate with default FUN
head(ymiss <- add_missing(y), 10)

## 50% missing with default FUN
head(ymiss <- add_missing(y, rate = .5), 10)

## missing values only when female and low
X <- data.frame(group = sample(c('male', 'female'), 1000, replace=TRUE),
                level = sample(c('high', 'low'), 1000, replace=TRUE))
head(X)

fun <- function(y, X, ...){
    p <- rep(0, length(y))
    p[X$group == 'female' & X$level == 'low'] <- .2
    p
}

ymiss <- add_missing(y, X, fun=fun)
tail(cbind(ymiss, X), 10)

## missingness as a function of elements in X (i.e., a type of MAR)
fun <- function(y, X){
   # missingness with a logistic regression approach
   df <- data.frame(y, X)
   mm <- model.matrix(y ~ group + level, df)
   cfs <- c(-5, 2, 3) #intercept, group, and level coefs
   z <- cfs %*% t(mm)
   plogis(z)
}

ymiss <- add_missing(y, X, fun=fun)
tail(cbind(ymiss, X), 10)

## missing values when y elements are large (i.e., a type of MNAR)
fun <- function(y) ifelse(abs(y) > 1, .4, 0)
ymiss <- add_missing(y, fun=fun)
tail(cbind(y, ymiss), 10)




