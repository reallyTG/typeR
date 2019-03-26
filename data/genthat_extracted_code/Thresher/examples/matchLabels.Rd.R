library(Thresher)


### Name: matchLabels
### Title: Match Arbitrary Class Assignments Across Methods
### Aliases: matchLabels labelMatcher labelAccuracy countAgreement
###   bestMetric remap
### Keywords: cluster classif multivariate

### ** Examples

factor1 <- sample(c("A", "B", "C"), 30, replace=TRUE)
factor2 <- rep(c("X", "Y", "Z"), each=10)
tab <- table(factor1, factor2)
matchLabels(tab)
labelMatcher(tab)
R <- remap(factor1, factor2)
table(R, factor2) # remapping
table(R, factor1) # cross-comparison



