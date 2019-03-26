library(genMOSS)


### Name: recode_data
### Title: Finding the optimal coding of diallelic SNPs
### Aliases: recode_data
### Keywords: htest models

### ** Examples

data(simuCC)
data <- simuCC[,c(1002,2971,rep(5978:6001))]
# The SNPs in columns 1002 and 2971 of simuCC called rs4491689 and rs6869003 cause the disease.
set.seed(7)
r <- recode_data (data, dimens = c(rep(3,25),2), alpha = 1) 
s <- mWindow (data = r$recoded_data, dimens = r$recoded_dimens, alpha = 1, windowSize = 2)
head (s, n = 5)



