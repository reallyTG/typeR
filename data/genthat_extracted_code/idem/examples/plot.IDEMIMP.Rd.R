library(idem)


### Name: plot.IDEMIMP
### Title: Plot imputation results
### Aliases: plot.IDEMIMP

### ** Examples

## Not run: 
##D im.abc <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
##D                  y0=NULL, endfml="Y2",
##D                  trt.label = c("UC+SBT", "SAT+SBT"),
##D                  cov=c("AGE"), duration=365, bounds=c(0,100));
##D rst.fit  <- imFitModel(im.abc);
##D rst.imp <- imImpAll(rst.fit, deltas=c(-0.25,0,0.25),
##D                     normal=TRUE, chains = 2, iter = 2000, warmup = 1000);
##D plot(rst.imp, opt = "imputed"),
##D plot(rst.imp, opt = "composite")
## End(Not run)



