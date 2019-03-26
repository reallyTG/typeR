library(beanz)


### Name: bzComp
### Title: Comparison of posterior treatment effects
### Aliases: bzComp bzSummaryComp bzPlotComp bzForestComp

### ** Examples

## Not run: 
##D var.cov    <- c("sodium", "lvef", "any.vasodilator.use");
##D var.resp   <- "y";
##D var.trt    <- "trt";
##D var.censor <- "censor";
##D resptype   <- "survival";
##D var.estvar <- c("Estimate", "Variance");
##D 
##D subgrp.effect <- bzGetSubgrpRaw(solvd.sub,
##D                              var.resp   = var.resp,
##D                              var.trt    = var.trt,
##D                              var.cov    = var.cov,
##D                              var.censor = var.censor,
##D                              resptype   = resptype);
##D 
##D rst.sr     <- bzCallStan("sr", dat.sub=subgrp.effect,
##D                          var.estvar=var.estvar, var.cov = var.cov,
##D                          par.pri=c(B=1000, C=1000),
##D                          chains=4, iter=500,
##D                          warmup=100, thin=2, seed=1000);
##D 
##D sel.grps <- c(1,4,5);
##D tbl.sub <- bzSummaryComp(rst.sr, sel.grps=sel.grps);
##D bzPlot(rst.sr, sel.grps = sel.grps);
##D bzForest(rst.sr, sel.grps = sel.grps);
## End(Not run)




