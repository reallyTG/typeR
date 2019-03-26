library(metafor)


### Name: dat.molloy2014
### Title: Studies on the Relationship between Conscientiousness and
###   Medication Adherence
### Aliases: dat.molloy2014
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.molloy2014))

### calculate r-to-z transformed correlations and corresponding sampling variances
dat <- escalc(measure="ZCOR", ri=ri, ni=ni, data=dat, slab=paste(authors, year, sep=", "))
dat

### meta-analysis of the transformed correlations using a random-effects model
res <- rma(yi, vi, data=dat)
res

### average correlation with 95% CI
predict(res, digits=3, transf=transf.ztor)

### forest plot
forest(res, addcred=TRUE, xlim=c(-1.6,1.6), atransf=transf.ztor, 
       at=transf.rtoz(c(-.4,-.2,0,.2,.4,.6)), digits=c(2,1), cex=.8)
text(-1.6, 18, "Author(s), Year", pos=4, cex=.8)
text( 1.6, 18, "Correlation [95% CI]", pos=2, cex=.8)

### funnel plot
funnel(res)



