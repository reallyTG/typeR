library(pearson7)


### Name: pearson7.fit
### Title: Find the MLE for a sample from the Pearson VII distribution with
###   shape parameter 3/2.
### Aliases: pearson7.fit

### ** Examples


y = rpearson7(100, 100, 10)
fit = pearson7.fit(y)
fit
summary(fit)




