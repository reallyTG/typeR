library(mada)


### Name: reitsma
### Title: Fit the bivariate model of Reitsma et al. (2005) and extensions.
### Aliases: reitsma reitsma.default
### Keywords: regression multivariate transformation

### ** Examples

data(Dementia)
(fit <- reitsma(Dementia))
summary(fit)
plot(fit)

## Meta-Regression
data(smoking) # contains more than one 2x2-table
## reduce to subset of independent 2x2-tables by using the 
## first table from each study only
smoking1 <- subset(smoking, smoking$result_id == 1)
## use type of questionnaire as covariate
(fit <- reitsma(smoking1, formula = cbind(tsens, tfpr) ~ type))
summary(fit) ## sensitivities significantly lower for SAQ



