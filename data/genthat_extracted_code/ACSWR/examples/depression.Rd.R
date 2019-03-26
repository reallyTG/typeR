library(ACSWR)


### Name: depression
### Title: The Hamilton Depression Scale Factor
### Aliases: depression
### Keywords: Wilcoxon test, Hamilton depression scale

### ** Examples

data(depression)
attach(depression)
names(depression)
wilcox.test(Y-X, alternative = "less")
wilcox.test(Y-X, alternative = "less",exact=FALSE,correct=FALSE)



