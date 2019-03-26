library(psych)


### Name: VSS.plot
### Title: Plot VSS fits
### Aliases: VSS.plot
### Keywords: multivariate models

### ** Examples

test.data <- Harman74.cor$cov
my.vss <- VSS(test.data)         #suggests that 4 factor complexity two solution is optimal
VSS.plot(my.vss,title="VSS of Holzinger-Harmon problem")                 #see the graphics window





