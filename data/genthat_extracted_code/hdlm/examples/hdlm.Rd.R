library(hdlm)


### Name: hdlm
### Title: Fitting High Dimensional Linear Models
### Aliases: hdlm hdlm.fit HDprintCoefmat print.hdlm print.summary.hdlm
###   plot.hdlm residuals.hdlm qr.hdlm simulate.hdlm deviance.hdlm
###   formula.hdlm family.hdlm model.frame.hdlm variable.names.hdlm
###   case.names.hdlm anova.hdlm predict.hdlm effects.hdlm
###   model.matrix.hdlm plot.hdlm labels.hdlm df.residual.hdlm
###   bayes.hdlm.fit bayesianLatentFit mod.cv.glmnet votingRecord
###   wordDataset

### ** Examples

  set.seed(1)
  x <- matrix(rnorm(100*40),ncol=100)
  y <- x[,1] + x[,2] * 0.5 + rnorm(40, sd=0.1)
  out <- hdlm(y ~ x)
  summary(out)



