library(sars)


### Name: summary.sars
### Title: Summarising the results of the model fitting functions
### Aliases: summary.sars

### ** Examples

data(galap)
#fit a multimodel SAR and get the model table
mf <- sar_multi(galap)
summary(mf)
summary(mf)$Model_table
#Get a summary of the fit of the linear power model
fit <- lin_pow(galap, con = 1, compare = TRUE)
summary(fit)



