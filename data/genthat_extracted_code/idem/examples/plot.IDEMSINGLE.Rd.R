library(idem)


### Name: plot.IDEMSINGLE
### Title: Plot MCMC mixing results
### Aliases: plot.IDEMSINGLE

### ** Examples

im.abc <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
                 y0=NULL, endfml="Y2",
                 trt.label = c("UC+SBT", "SAT+SBT"),
                 cov=c("AGE"), duration=365, bounds=c(0,100));
im.fit <- imFitModel(im.abc);
im.imp.single <- imImpSingle(abc[1,], im.fit,
                             chains = 4, iter = 200, warmup = 100);
plot(im.imp.single);




