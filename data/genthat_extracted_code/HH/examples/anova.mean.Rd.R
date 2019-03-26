library(HH)


### Name: anovaMean
### Title: ANOVA table from the group sample sizes, means, and standard
###   deviations.
### Aliases: anovaMean
### Keywords: models

### ** Examples

## pulmonary data used in Hsu and Peruggia paper defining the mean-mean plot
## See ?plot.mmc.multicomp for details on the dataset.

data(pulmonary)

anovaMean(pulmonary$smoker,
          pulmonary$n,
          pulmonary$FVC,
          pulmonary$s,
          ylabel="pulmonary")



