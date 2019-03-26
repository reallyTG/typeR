library(stratification)


### Name: MRTS
### Title: Simulated Data from the Monthly Retail Trade Survey (MRTS) of
###   Statistics Canada
### Aliases: MRTS
### Keywords: datasets

### ** Examples

# Production of results similar to those in Table 1 of Baillargeon, Rivest
# and Ferland (2007). The results are not the same because calculations in
# the paper were conducted on real data whereas, for confidentiality reason, 
# the MRTS data included in the package is simulated.
geo <- strata.geo(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5))
geo
aRRMSE.geo <- var.strata(geo, model="loglinear",
              model.control=list(beta=0.9, sig2=0.015, ph=c(0.8,0.9,0.95,1)))
aRRMSE.geo$RRMSE
plot(geo, logscale=TRUE)
# The geometric method does not perform well because of some small units

cumrootf <- strata.cumrootf(x=MRTS, nclass=500, CV=0.01, Ls=4, alloc=c(0.5,0,0.5))
cumrootf
aRRMSE.cum <- var.strata(cumrootf, rh=c(0.85,0.9,0.9,1), model="loglinear",
              model.control=list(beta=0.9, sig2=0.015, ph=c(0.8,0.9,0.95,1)))
aRRMSE.cum$RRMSE

LH <- strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1, algo="Sethi")
LH
aRRMSE.LH <- var.strata(LH, rh=c(0.85,0.9,0.9,1), model="loglinear",
             model.control=list(beta=0.9, sig2=0.015, ph=c(0.8,0.9,0.95,1)))
aRRMSE.LH$RRMSE

LH.full <- strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1,
           algo="Sethi", rh=c(0.85,0.9,0.9,1), model="loglinear",
           model.control=list(beta=0.9, sig2=0.015, ph=c(0.8,0.9,0.95,1)))
LH.full
aRRMSE.LH.full <- var.strata(LH.full, rh=c(0.85,0.9,0.9,1), model="loglinear",
                  model.control=list(beta=0.9, sig2=0.015, ph=c(0.8,0.9,0.95,1)))
aRRMSE.LH.full$RRMSE



