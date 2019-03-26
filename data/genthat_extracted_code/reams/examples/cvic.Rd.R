library(reams)


### Name: cvic
### Title: Cross-validation information criterion
### Aliases: cvic

### ** Examples

# Predicting fertility from provincial socioeconomic indicators
data(swiss)
cvicobj <- cvic(swiss$Fertility, swiss[ , -1])
cvicobj$best
cvicobj$best.mon



