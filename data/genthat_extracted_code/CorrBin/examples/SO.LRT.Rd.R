library(CorrBin)


### Name: SO.LRT
### Title: Likelihood-ratio test statistic
### Aliases: SO.LRT
### Keywords: htest nonparametric

### ** Examples

data(shelltox)
LRT <- SO.LRT(shelltox, control=soControl(max.iter = 100, max.directions = 50))
LRT



