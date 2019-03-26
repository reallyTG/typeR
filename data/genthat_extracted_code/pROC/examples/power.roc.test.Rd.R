library(pROC)


### Name: power.roc.test
### Title: Sample size and power computation for ROC curves
### Aliases: power.roc.test power.roc.test.numeric power.roc.test.roc
###   power.roc.test.list
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

#### One ROC curve ####

# Build a roc object:
rocobj <- roc(aSAH$outcome, aSAH$s100b)

# Determine power of one ROC curve:
power.roc.test(rocobj)
# Same as:
power.roc.test(ncases=41, ncontrols=72, auc=0.73, sig.level=0.05)
# sig.level=0.05 is implicit and can be omitted:
power.roc.test(ncases=41, ncontrols=72, auc=0.73)

# Determine ncases & ncontrols:
power.roc.test(auc=rocobj$auc, sig.level=0.05, power=0.95, kappa=1.7)
power.roc.test(auc=0.73, sig.level=0.05, power=0.95, kappa=1.7)

# Determine sig.level:
power.roc.test(ncases=41, ncontrols=72, auc=0.73, power=0.95, sig.level=NULL)

# Derermine detectable AUC:
power.roc.test(ncases=41, ncontrols=72, sig.level=0.05, power=0.95)


#### Two ROC curves ####

###  Full AUC
roc1 <- roc(aSAH$outcome, aSAH$ndka)
roc2 <- roc(aSAH$outcome, aSAH$wfns)

## Sample size
# With DeLong variance (default)
power.roc.test(roc1, roc2, power=0.9)
# With Obuchowski variance
power.roc.test(roc1, roc2, power=0.9, method="obuchowski")

## Power test
# With DeLong variance (default)
power.roc.test(roc1, roc2)
# With Obuchowski variance
power.roc.test(roc1, roc2, method="obuchowski")

## Significance level
# With DeLong variance (default)
power.roc.test(roc1, roc2, power=0.9, sig.level=NULL)
# With Obuchowski variance
power.roc.test(roc1, roc2, power=0.9, sig.level=NULL, method="obuchowski")

### Partial AUC
roc3 <- roc(aSAH$outcome, aSAH$ndka, partial.auc=c(1, 0.9))
roc4 <- roc(aSAH$outcome, aSAH$wfns, partial.auc=c(1, 0.9))

## Sample size
# With bootstrap variance (default)
## Not run: 
##D power.roc.test(roc3, roc4, power=0.9)
## End(Not run)
# With Obuchowski variance
power.roc.test(roc3, roc4, power=0.9, method="obuchowski")

## Power test
# With bootstrap variance (default)
## Not run: 
##D power.roc.test(roc3, roc4)
##D # This is exactly equivalent:
##D power.roc.test(roc1, roc2, reuse.auc=FALSE, partial.auc=c(1, 0.9))
## End(Not run)
# With Obuchowski variance
power.roc.test(roc3, roc4, method="obuchowski")

## Significance level
# With bootstrap variance (default)
## Not run: 
##D power.roc.test(roc3, roc4, power=0.9, sig.level=NULL)
## End(Not run)
# With Obuchowski variance
power.roc.test(roc3, roc4, power=0.9, sig.level=NULL, method="obuchowski")

## With only binormal parameters given
# From example 2 of Obuchowski and McClish, 1997.
ob.params <- list(A1=2.6, B1=1, A2=1.9, B2=1, rn=0.6, ra=0.6, FPR11=0,
FPR12=0.2, FPR21=0, FPR22=0.2, delta=0.037) 

power.roc.test(ob.params, power=0.8, sig.level=0.05)
power.roc.test(ob.params, power=0.8, sig.level=NULL, ncases=107)
power.roc.test(ob.params, power=NULL, sig.level=0.05, ncases=107)




