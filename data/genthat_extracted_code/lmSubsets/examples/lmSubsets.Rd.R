library(lmSubsets)


### Name: lmSubsets
### Title: All-Subsets Regression
### Aliases: lmSubsets lmSubsets.default lmSubsets.matrix lmSubsets_fit
###   print.lmSubsets plot.lmSubsets summary.lmSubsets
###   print.summary.lmSubsets
### Keywords: regression

### ** Examples

## load data (with logs for relative potentials)
data("AirPollution", package = "lmSubsets")


###################
##  basic usage  ##
###################

## canonical example: fit all subsets
lm_all <- lmSubsets(mortality ~ ., data = AirPollution, nbest = 5)
lm_all

## plot RSS and BIC
plot(lm_all)

## summary statistics
summary(lm_all)


############################
##  forced in-/exclusion  ##
############################

lm_force <- lmSubsets(lm_all, include = c("nox", "so2"),
                      exclude = "whitecollar")
lm_force


########################
##  matrix interface  ##
########################

## same as above
x <- as.matrix(AirPollution)

lm_mat <- lmSubsets(x, y = "mortality")
lm_mat



