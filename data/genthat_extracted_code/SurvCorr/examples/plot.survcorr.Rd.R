library(SurvCorr)


### Name: plot.survcorr
### Title: Plot Correlated Bivariate Survival Times
### Aliases: plot.survcorr plot
### Keywords: survival correlation IMI

### ** Examples

## Example 2
data(diabetes)
obj <- survcorr(formula1=Surv(TIME1, STATUS1) ~ 1, formula2=Surv(TIME2, STATUS2) ~ 1, 
  data=diabetes, M=100, MCMCSteps=10, alpha=0.05, epsilon=0.001)
plot(obj, "times")
plot(obj, "copula", imputation=1)
plot(obj, "copula", imputation=7)




