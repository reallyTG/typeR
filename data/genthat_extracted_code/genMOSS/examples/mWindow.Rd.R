library(genMOSS)


### Name: mWindow
### Title: Analyzing GWAS data in sequence over a moving window
### Aliases: mWindow
### Keywords: htest models

### ** Examples

data(simuCC)
data <- simuCC[,c(1002,2971,rep(5978:6001))]
# The SNPs in columns 1002 and 2971 of simuCC called rs4491689 and rs6869003 cause the disease.
set.seed(7)
s <- mWindow (data, dimens = c(rep(3,25),2), alpha = 1, windowSize = 2)
head (s, n = 5)



