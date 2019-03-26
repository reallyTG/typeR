library(ANOM)


### Name: ANOMgen
### Title: Generic Function for Drawing ANOM Decision Charts
### Aliases: ANOMgen
### Keywords: ~dplot

### ** Examples
## No test: 
### A toy example (n given, two-sided)
groupmeans <- c(2.8, 2.3, 3.4, 5.6)
samplesizes <- c(5, 5, 10, 5)
low <- c(-1.2, -1.7, -0.4, 1.6)
upp <- c(-0.2, -0.7, 0.2, 2.6)
names <- c("1st", "2nd", "3rd", "4th")
ANOMgen(mu=groupmeans, n=samplesizes, lo=low, up=upp, names=names, alternative="two.sided")

### Another toy example (gm given, one-sided, with p-values)
groupmeans <- c(2.8, 2.3, 3.4, 5.6)
gm <- 3.5
low <- rep(-Inf, 4)
upp <- c(-0.2, -0.7, 0.2, 2.6)
names <- c("1st", "2nd", "3rd", "4th")
pvalues <- c(0.01, 0.003, 0.8, 1)
ANOMgen(mu=groupmeans, gm=gm, lo=low, up=upp, names=names, alternative="less", p=pvalues)
## End(No test)


