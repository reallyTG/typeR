library(tsDyn)


### Name: TVECM
### Title: Threshold Vector Error Correction model (VECM)
### Aliases: TVECM
### Keywords: ts

### ** Examples



data(zeroyld)

##Estimate a TVECM (we use here minimal grid, it should be usually much bigger!)

tvec <- TVECM(zeroyld, nthresh=2,lag=1, ngridBeta=20, ngridTh=30, plot=TRUE,trim=0.05, common="All")

print(tvec)
summary(tvec)

#Obtain diverse infos:
AIC(tvec)
BIC(tvec)

res.tvec<-residuals(tvec)

#export the equations as Latex:
toLatex(tvec)




