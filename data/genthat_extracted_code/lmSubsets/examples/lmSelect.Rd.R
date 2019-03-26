library(lmSubsets)


### Name: lmSelect
### Title: Best-Subset Regression
### Aliases: lmSelect lmSelect.default lmSelect.matrix lmSelect.lmSubsets
###   lmSelect_fit lmSubsets_select print.lmSelect plot.lmSelect
###   summary.lmSelect print.summary.lmSelect
### Keywords: regression

### ** Examples

## load data (with logs for relative potentials)
data("AirPollution", package = "lmSubsets")


###################
##  basic usage  ##
###################

## fit 20 best subsets (BIC)
lm_best <- lmSelect(mortality ~ ., data = AirPollution, nbest = 20)
lm_best

## equivalent to:
## Not run: 
##D lm_all <- lmSubsets(mortality ~ ., data = AirPollution, nbest = 20)
##D lm_best <- lmSelect(lm_all)
## End(Not run)

## summary statistics
summary(lm_best)

## visualize
plot(lm_best)


########################
##  custom criterion  ##
########################

## the same as above, but with a custom criterion:
M <- nrow(AirPollution)

ll <- function (rss) {
  -M/2 * (log(2 * pi) - log(M) + log(rss) + 1)
}

aic <- function (size, rss, k = 2) {
  -2 * ll(rss) + k * (size + 1)
}

bic <- function (size, rss) {
  aic(size, rss, k = log(M))
}

lm_cust <- lmSelect(mortality ~ ., data = AirPollution,
                    penalty = bic, nbest = 20)
lm_cust



