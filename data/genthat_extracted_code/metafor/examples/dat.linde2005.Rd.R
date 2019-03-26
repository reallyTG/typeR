library(metafor)


### Name: dat.linde2005
### Title: Studies on the Effectiveness of St. John's Wort for Treating
###   Depression
### Aliases: dat.linde2005
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.linde2005))

### remove studies with no response information and study with no responses in either group
dat <- dat[-c(5,6,26),]

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=ai, ci=ci, n1i=n1i, n2i=n2i, data=dat)

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(yi, vi, data=dat, method="DL")
res

### mixed-effects meta-regression model with stratification variable
res <- rma(yi, vi, mods = ~ factor(group) - 1, data=dat, method="DL")
res

### predicted average risk ratio for each level of the stratification variable
predict(res, newmods=diag(4), transf=exp, digits=2)



