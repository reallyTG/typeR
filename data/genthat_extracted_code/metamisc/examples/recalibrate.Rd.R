library(metamisc)


### Name: recalibrate
### Title: Recalibrate a Prediction Model
### Aliases: recalibrate

### ** Examples

data(DVTipd)
DVTipd$cluster <- 1:4 # Add a fictional clustering to the data set.
# Suppose we estimated the model in three studies: 
DVTipd123 <- DVTipd[DVTipd$cluster <= 3, ]
mp <- metamisc:::metapred(DVTipd123, strata = "cluster", f = dvt ~ vein + malign, 
family = binomial)
# and now want to recalibrate it for the fourth:
DVTipd4 <- DVTipd[DVTipd$cluster == 4, ]
metamisc:::recalibrate(mp, newdata = DVTipd4)




