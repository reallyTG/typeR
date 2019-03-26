library(pROC)


### Name: pROC-package
### Title: pROC
### Aliases: pROC-package pROC
### Keywords: package univar nonparametric utilities print htest aplot
###   hplot roc

### ** Examples

data(aSAH)

# Build a ROC object and compute the AUC
roc(aSAH$outcome, aSAH$s100b)
roc(outcome ~ s100b, aSAH)

# Smooth ROC curve
roc(outcome ~ s100b, aSAH, smooth=TRUE)

# more options, CI and plotting
roc1 <- roc(aSAH$outcome,
            aSAH$s100b, percent=TRUE,
            # arguments for auc
            partial.auc=c(100, 90), partial.auc.correct=TRUE,
            partial.auc.focus="sens",
            # arguments for ci
            ci=TRUE, boot.n=100, ci.alpha=0.9, stratified=FALSE,
            # arguments for plot
            plot=TRUE, auc.polygon=TRUE, max.auc.polygon=TRUE, grid=TRUE,
            print.auc=TRUE, show.thres=TRUE)

# Add to an existing plot. Beware of 'percent' specification!
roc2 <- roc(aSAH$outcome, aSAH$wfns,
            plot=TRUE, add=TRUE, percent=roc1$percent)

## Coordinates of the curve ##
coords(roc1, "best", ret=c("threshold", "specificity", "1-npv"))
coords(roc2, "local maximas", ret=c("threshold", "sens", "spec", "ppv", "npv"))

## Confidence intervals ##

# CI of the AUC
ci(roc2)

## Not run: 
##D # CI of the curve
##D sens.ci <- ci.se(roc1, specificities=seq(0, 100, 5))
##D plot(sens.ci, type="shape", col="lightblue")
##D plot(sens.ci, type="bars")
## End(Not run)

# need to re-add roc2 over the shape
plot(roc2, add=TRUE)

## Not run: 
##D # CI of thresholds
##D plot(ci.thresholds(roc2))
## End(Not run)

# In parallel
if (require(doParallel)) {
    registerDoParallel(cl <- makeCluster(getOption("mc.cores", 2L)))
    ## Not run: ci(roc2, method="bootstrap", parallel=TRUE)
    ## Don't show: 
ci(roc2, method="bootstrap", parallel=TRUE, boot.n=20)
## End(Don't show)
    stopCluster(cl)
}

## Comparisons ##

# Test on the whole AUC
roc.test(roc1, roc2, reuse.auc=FALSE)

## Not run: 
##D # Test on a portion of the whole AUC
##D roc.test(roc1, roc2, reuse.auc=FALSE, partial.auc=c(100, 90),
##D          partial.auc.focus="se", partial.auc.correct=TRUE)
##D 
##D # With modified bootstrap parameters
##D roc.test(roc1, roc2, reuse.auc=FALSE, partial.auc=c(100, 90),
##D          partial.auc.correct=TRUE, boot.n=1000, boot.stratified=FALSE)
## End(Not run)



