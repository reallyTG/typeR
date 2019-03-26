library(metafor)


### Name: dat.yusuf1985
### Title: Studies of Beta Blockers During and After Myocardial Infarction
### Aliases: dat.yusuf1985
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.yusuf1985))

### to select a table for the analysis
tab <- "6" ### either: 6, 9, 10, 11, 12a, 12b

### to double-check total counts as reported in article
apply(dat[dat$table==tab,4:7], 2, sum, na.rm=TRUE)

### meta-analysis using Peto's one-step method
res <- rma.peto(ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, subset=(table==tab))
res
predict(res, transf=exp, digits=2)



