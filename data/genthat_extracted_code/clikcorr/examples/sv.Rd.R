library(clikcorr)


### Name: sv
### Title: Calculating starting values for the vector of (mean1, mean2,
###   var1, corr, var2) from completely observed data.
### Aliases: sv

### ** Examples


data(ND)
logND <- log(ND)

sv(logND, "t1_TCDD", "t2_TCDD", "t1_PeCDD", "t2_PeCDD")




