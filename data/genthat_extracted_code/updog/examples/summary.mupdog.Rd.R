library(updog)


### Name: summary.mupdog
### Title: Provides some summaries from the output of 'mupdog'.
### Aliases: summary.mupdog

### ** Examples

data(mupout)
msum <- summary(mupout)
msum$freq[, 1:5]
boxplot(msum$mean_dosage ~ mupout$map_dosage,
        xlab = "MAP Dosage", ylab = "Mean Dosage")




