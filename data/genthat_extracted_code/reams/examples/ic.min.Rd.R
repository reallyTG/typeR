library(reams)


### Name: ic.min
### Title: AIC, corrected AIC and BIC for all-subsets linear regression
### Aliases: ic.min

### ** Examples

# Predicting fertility from provincial socioeconomic indicators
data(swiss)
ic.min(swiss$Fertility, swiss[ , -1])



