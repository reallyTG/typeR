library(idem)


### Name: imFitModel
### Title: Imputation model fitting
### Aliases: imFitModel

### ** Examples

im.abc <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
                 y0=NULL, endfml="Y2",
                 trt.label = c("UC+SBT", "SAT+SBT"),
                 cov=c("AGE"), duration=365, bounds=c(0,100));
im.fit <- imFitModel(im.abc);




