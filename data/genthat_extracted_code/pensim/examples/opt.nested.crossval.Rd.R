library(pensim)


### Name: opt.nested.crossval
### Title: Parallelized calculation of cross-validated risk score
###   predictions from L1/L2/Elastic Net penalized regression.
### Aliases: opt.nested.crossval
### Keywords: regression survival

### ** Examples

data(beer.exprs)
data(beer.survival)

##select just 100 genes to speed computation:
set.seed(1)
beer.exprs.sample <- beer.exprs[sample(1:nrow(beer.exprs), 100), ]

gene.quant <- apply(beer.exprs.sample, 1, quantile, probs=0.75)
dat.filt <- beer.exprs.sample[gene.quant>log2(100), ]
gene.iqr <- apply(dat.filt, 1, IQR)
dat.filt <- as.matrix(dat.filt[gene.iqr>0.5, ])
dat.filt <- t(dat.filt)
dat.filt <- data.frame(dat.filt)

library(survival)
surv.obj <- Surv(beer.survival$os, beer.survival$status)

## First, test the regression arguments using functions from
## the penalized package.  I use maxlambda1=5 here to ensure at least
## one non-zero coefficient.
testfit <- penalized::optL1(response=surv.obj, 
                 maxlambda1=5,
                 penalized=dat.filt,
                 fold=5,
                 positive=FALSE,
                 standardize=TRUE,
                 trace=TRUE)

## Now pass these arguments to opt.nested.splitval() for cross-validated
## calculation and assessment of risk scores, with the additional
## arguments:
##    outerfold and nprocessors (?opt.nested.crossval)
##    optFUN and scaling (?opt.splitval)
##    setpen and nsim (?opt1D)

## Ideally nsim would be 50, and outerfold and fold would be 10, but the
## values below speed computation 200x compared to these recommended
## values.  Note that here we are using the standardize=TRUE argument of
## optL1 rather than the scaling=TRUE argument of opt.splitval.  These
## two approaches to scaling are roughly equivalent, but the scaling
## approaches are not the same (scaling=TRUE does z-score,
## standardize=TRUE scales to unit central L2 norm), and results will
## not be identical.  Also, using standardize=TRUE scales variables but
## provides coeffients for the original scale, whereas using
## scaling=TRUE scales variables in the training set then applies the
## same scales to the test set.
set.seed(1)
## In this example I use two processors:
preds <- opt.nested.crossval(outerfold=5, nprocessors=2,  #opt.nested.crossval arguments
             optFUN="opt1D", scaling=FALSE,               #opt.splitval arguments
             setpen="L1", nsim=1,                         #opt1D arguments
             response=surv.obj,                          #rest are penalized::optl1 arguments
             penalized=dat.filt,
             fold=2,
             maxlambda1=5,
             positive=FALSE,
             standardize=TRUE,
             trace=FALSE)

## We probably also want the coefficients from the model fit on all the
## data, for future use:
beer.coefs <- opt1D(setpen="L1", nsim=1,
             maxlambda1=5,
             response=surv.obj,                         
             penalized=dat.filt,
             fold=5,
             positive=FALSE,
             standardize=TRUE,
             trace=FALSE)

## We can also include unpenalized covariates, if desired.
## Note that when keeping only one variable for a penalized or
## unpenalized covariate, indexing a dataframe like [1] instead of doing
## [,1] preserves the variable name.  With [,1] the variable name gets
## converted to "".

beer.coefs <- opt1D(setpen="L1", nsim=1, 
             maxlambda1=5,
             response=surv.obj,                         
             penalized=dat.filt[-1],   # This is equivalent to dat.filt[, -1]
             unpenalized=dat.filt[1],  
             fold=5,
             positive=FALSE,
             standardize=TRUE,
             trace=FALSE)
## (note the non-zero first coefficient this time, due to it being unpenalized).

## Summarization and plotting.
preds.dichot <- preds > median(preds)

coxfit.continuous <- coxph(surv.obj~preds)
coxfit.dichot <- coxph(surv.obj~preds.dichot)
summary(coxfit.continuous)
summary(coxfit.dichot)

if(require(survivalROC)){
  nobs <- length(preds)
  cutoff <- 12
  preds.roc <- survivalROC(Stime=beer.survival$os, status=beer.survival$status,
                         marker=preds, predict.time=cutoff, span = 0.25*nobs^(-0.20))
  plot(preds.roc$FP,  preds.roc$TP, type="l", xlim=c(0,1), ylim=c(0,1),
       lty=2,
       xlab=paste( "FP", "\n", "AUC = ", round(preds.roc$AUC, 3)), 
       ylab="TP", main="LASSO predictions\n ROC curve at 12 months")
  abline(0, 1)
}

## clean-up
rm(nobs, cutoff, preds.roc, coxfit.dichot, coxfit.continuous, preds, 
   preds.dichot, dat.filt, gene.iqr, gene.quant)



