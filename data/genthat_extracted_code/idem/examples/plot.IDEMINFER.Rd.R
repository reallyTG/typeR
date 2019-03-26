library(idem)


### Name: plot.IDEMINFER
### Title: Plot hypothesis testing results
### Aliases: plot.IDEMINFER

### ** Examples

## Not run: 
##D rst.abc <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
##D                  y0=NULL, endfml="Y2",
##D                  trt.label = c("UC+SBT", "SAT+SBT"),
##D                  cov=c("AGE"), duration=365, bounds=c(0,100));
##D rst.fit  <- imFitModel(rst.abc);
##D rst.imp <- imImpAll(rst.fit, deltas=c(-0.25,0,0.25),
##D                     normal=TRUE, chains = 2, iter = 2000, warmup = 1000);
##D rst.est <- imInfer(rst.imp, n.boot = 100);
##D plot(rst.est);
## End(Not run)




