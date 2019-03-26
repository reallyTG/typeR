library(SurvCorr)


### Name: survcorr
### Title: Correlation Analysis of Survival Times by Iterative Multiple
###   Imputation
### Aliases: survcorr Surv
### Keywords: survival correlation IMI

### ** Examples

## Example 1
data(kidney)
obj = survcorr(formula1=Surv(TIME1, STATUS1) ~ 1, formula2=Surv(TIME2, STATUS2) ~ 1, 
  data=kidney, M=1000, MCMCSteps=10, alpha=0.05, epsilon=0.001)

## Example 2
data(diabetes)
obj = survcorr(formula1=Surv(TIME1, STATUS1) ~ 1, formula2=Surv(TIME2, STATUS2) ~ 1, 
  data=diabetes, M=100, MCMCSteps=10, alpha=0.05, epsilon=0.001)
plot(obj, "times")





