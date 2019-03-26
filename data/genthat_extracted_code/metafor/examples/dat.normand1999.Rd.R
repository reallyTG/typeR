library(metafor)


### Name: dat.normand1999
### Title: Studies on the Length of Hospital Stay of Stroke Patients
### Aliases: dat.normand1999
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.normand1999))

### calculate mean differences and corresponding sampling variances
dat <- escalc(measure="MD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat)
dat

### meta-analysis of mean differences using a random-effects model
res <- rma(yi, vi, data=dat)
res

### meta-analysis of standardized mean differences using a random-effects model
res <- rma(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, 
           data=dat, slab=source)
res

### draw forest plot
forest(res, xlim=c(-7,5), alim=c(-3,1), cex=.8)
text(-7, 11, "Study/Source",          pos=4, cex=.8)
text( 5, 11, "Observed SMD [95% CI]", pos=2, cex=.8)



