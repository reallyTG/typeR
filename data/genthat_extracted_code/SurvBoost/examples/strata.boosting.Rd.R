library(SurvBoost)


### Name: strata.boosting
### Title: Stratification function
### Aliases: strata.boosting
### Keywords: boosting gradient

### ** Examples

data <- simulate_survival_cox(true_beta=c(1,1,1,1,1,0,0,0,0,0))
strata.boosting(data$strata_idx, data$time)




