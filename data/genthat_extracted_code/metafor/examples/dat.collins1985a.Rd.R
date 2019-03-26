library(metafor)


### Name: dat.collins1985a
### Title: Studies on the Treatment of Upper Gastrointestinal Bleeding by a
###   Histamine H2 Antagonist
### Aliases: dat.collins1985a
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.collins1985a))

### meta-analysis of log ORs using Peto's method (outcome: persistent or recurrent bleedings)
res <- rma.peto(ai=b.xti, n1i=nti, ci=b.xci, n2i=nci, data=dat)
print(res, digits=2)

## Not run: 
##D ### meta-analysis of log ORs using a conditional logistic regression model (FE model)
##D res <- rma.glmm(measure="OR", ai=b.xti, n1i=nti, ci=b.xci, n2i=nci, data=dat,
##D                 model="CM.EL", method="FE")
##D summary(res)
##D predict(res, transf=exp, digits=2)
##D 
##D ### plot the log-likelihoods of the odds ratios
##D llplot(measure="OR", ai=b.xti, n1i=nti, ci=b.xci, n2i=nci, data=dat,
##D        lwd=1, refline=NA, xlim=c(-4,4), drop00=FALSE)
##D 
##D ### meta-analysis of log odds ratios using a conditional logistic regression model (RE model)
##D res <- rma.glmm(measure="OR", ai=b.xti, n1i=nti, ci=b.xci, n2i=nci, data=dat,
##D                 model="CM.EL", method="ML")
##D summary(res)
##D predict(res, transf=exp, digits=2)
## End(Not run)

### meta-analysis of log ORs using Peto's method (outcome: need for surgery)
res <- rma.peto(ai=o.xti, n1i=nti, ci=o.xci, n2i=nci, data=dat)
print(res, digits=2)

### meta-analysis of log ORs using Peto's method (outcome: death)
res <- rma.peto(ai=d.xti, n1i=nti, ci=d.xci, n2i=nci, data=dat)
print(res, digits=2)



