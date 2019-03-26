library(npsurv)


### Name: plot.npsurv
### Title: Plot Functions for Nonparametric Survival Estimation
### Aliases: plot.npsurv plot.idf plotsurvidf plotgradidf
### Keywords: function

### ** Examples

data(ap)
plot(r<-npsurv(ap))              # survival function
plot(r$f, ap, fn="g")            # all gradients virtually zeros.

data(cancer)
cancerRT = with(cancer, cancer[group=="RT",1:2])
plot(rt<-npsurv(cancerRT), xlim=c(0,60))                  # survival of RT 
cancerRCT = with(cancer, cancer[group=="RCT",1:2])
plot(rct<-npsurv(cancerRCT), add=TRUE, col="green3") # survival of RCT 
## as uniform dististrbutions.
plot(rt, add=TRUE, style="uniform", col="blue3")
plot(rct, add=TRUE, style="uniform", col="green3")

## plot gradients; must supply data
plot(rt, cancerRT, fn="g")        # for group RT
plotgradidf(rct$f, cancerRCT)   # or, for group RCT



