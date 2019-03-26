library(MRsurv)


### Name: MRsurvival
### Title: Multiplicative-regression model to compare the risk factors
###   between a reference and relative populations.
### Aliases: MRsurvival
### Keywords: relative survival multiplicative regression partial
###   likelihood

### ** Examples


# import and attach both samples
data(FTR.data)
data(STR.data)

# We reduce the dimension to save time for this example (CRAN policies)
STR.data <- STR.data[1:100,]

# Compute the Cox model in the reference sample (FTR)
cox.FTR<-coxph(Surv(Tps.Evt, Evt)~ ageR2cl + sexeR, data=FTR.data)
summary(cox.FTR)


# Compute the multiplicative relative model (STR)
mrs.STR <- MRsurvival(time.ref="Tps.Evt", status.ref="Evt",
 cov.rel=c("ageR2cl", "Tattente2cl"),
 data.rel=STR.data, cox.ref=cox.FTR, cov.ref=c("ageR2cl", "sexeR"),
 init=c(0,0), B=5)
  # Of course, choose B>>5 for real applications
  
# The values at each iteration
mrs.STR$matrix.coef

# The parameters estimations (mean of the values)
mrs.STR$estim.coef 
apply(mrs.STR$matrix.coef, FUN="mean", MARGIN=2)

# The 95% confidence intervals
cbind(mrs.STR$lower95.coef, mrs.STR$upper95.coef) 



