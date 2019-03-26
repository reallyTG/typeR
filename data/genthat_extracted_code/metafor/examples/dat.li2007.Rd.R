library(metafor)


### Name: dat.li2007
### Title: Studies on the Effectiveness of Intravenous Magnesium in Acute
###   Myocardial Infarction.
### Aliases: dat.li2007
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.li2007))

### meta-analysis of all trials except ISIS-4
res <- rma(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, method="FE", subset=-14)
print(res, digits=2)
predict(res, transf=exp, digits=2)

### meta-analysis of all trials including ISIS-4
res <- rma(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, method="FE")
print(res, digits=2)
predict(res, transf=exp, digits=2)

### contour-enhanced funnel plot centered at 0
funnel(res, refline=0, level=c(90, 95, 99), shade=c("white", "gray", "darkgray"))



