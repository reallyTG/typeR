library(SurvBoost)


### Name: summary.boosting
### Title: Summary of boosting model selection
### Aliases: summary.boosting
### Keywords: boosting gradient

### ** Examples

data <- simulate_survival_cox(true_beta=c(1,1,1,1,1,0,0,0,0,0))
formula <- as.formula("Surv(time,delta) ~ strata(strata_idx) + V1 + V2 + 
V3 + V4 + V5 + V6 + V7 + V8 + V9 + V10" )
boosting.output <- boosting_core(formula, data, rate=0.1, control=500)
summary.boosting(boosting.output)




