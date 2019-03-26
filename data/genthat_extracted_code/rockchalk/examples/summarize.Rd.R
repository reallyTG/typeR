library(rockchalk)


### Name: summarize
### Title: Sorts numeric from discrete variables and returns separate
###   summaries for those types of variables.
### Aliases: summarize

### ** Examples

library(rockchalk)


set.seed(23452345)
N <- 100
x1 <- gl(12, 2, labels = LETTERS[1:12])
x2 <- gl(8, 3, labels = LETTERS[12:24])
x1 <- sample(x = x1, size=N, replace = TRUE)
x2 <- sample(x = x2, size=N, replace = TRUE)
z1 <- rnorm(N)
a1 <- rnorm(N, mean = 1.2, sd = 11.7)
a2 <- rpois(N, lambda = 10 + abs(a1))
a3 <- rgamma(N, 0.5, 4)
b1 <- rnorm(N, mean = 211.3, sd = 0.4)
dat <- data.frame(z1, a1, x2, a2, x1, a3, b1)
summary(dat)

summarize(dat)

summarize(dat, digits = 4)

summarize(dat, stats = c("min", "max", "mean", "sd"),
          probs = c(0.25, 0.75))

summarize(dat, probs = c(0, 0.20, 0.80),
          stats = c("nobs", "mean", "med", "entropy"))

summarize(dat, probs = c(0, 0.20, 0.50),
          stats = c("nobs", "nmiss", "mean", "entropy"), maxLevels=10)

dat.sum <- summarize(dat, probs = c(0, 0.20, 0.50),
                     stats = c("nobs", "nmiss", "mean", "entropy"), maxLevels=10)
dat.sum
## Inspect unformatted structure of objects within return
dat.sum[["numerics"]]
dat.sum[["factors"]]

## Only quantile values, no summary stats for numeric variables
## Discrete variables get entropy
summarize(dat, 
          probs = c(0, 0.25, 0.50, 0.75, 1.0),
          stats = "entropy", digits = 2)

## Quantiles and the mean for numeric variables.
## No diversity stats for discrete variables (entropy omitted)
summarize(dat, 
          probs = c(0, 0.25, 0.50, 0.75, 1.0),
          stats = "mean")

summarize(dat, 
          probs = NULL,
          stats = "mean")

## Note: output is not beautified by a print method
dat.sn <- summarizeNumerics(dat)
dat.sn
formatSummarizedNumerics(dat.sn)
formatSummarizedNumerics(dat.sn, digits = 5)

dat.summ <- summarize(dat)


dat.sf <- summarizeFactors(dat, maxLevels = 20)
dat.sf
formatSummarizedFactors(dat.sf)

## See actual values of factor summaries, without
## beautified printing
summarizeFactors(dat, maxLevels = 5)
formatSummarizedFactors(summarizeFactors(dat, maxLevels = 5))

summarize(dat, alphaSort = TRUE) 

summarize(dat, digits = 6, alphaSort = FALSE)


summarize(dat, maxLevels = 2)

datsumm <- summarize(dat, stats = c("mean", "sd", "var", "entropy", "nobs"))

## Unbeautified numeric data frame, variables on the rows
datsumm[["numerics"]]
## Beautified versions 1. shows saved version:
attr(datsumm, "numeric.formatted")
## 2. Run formatSummarizedNumerics to re-specify digits:
formatSummarizedNumerics(datsumm[["numerics"]], digits = 10)

datsumm[["factors"]]
formatSummarizedFactors(datsumm[["factors"]])
formatSummarizedFactors(datsumm[["factors"]], digits = 6, maxLevels = 10)



