library(beanz)


### Name: bzCallStan
### Title: Call STAN models
### Aliases: bzCallStan

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
##D                                   var.resp   = var.resp,
##D                                   var.trt    = var.trt,
##D                                   var.cov    = var.cov,
##D                                   var.censor = var.censor,
##D                                   resptype   = resptype);
##D 
##D rst.nse    <- bzCallStan("nse", dat.sub=subgrp.effect,
##D                          var.estvar = var.estvar, var.cov = var.cov,
##D                          par.pri = c(B=1000),
##D                          chains=4, iter=600,
##D                          warmup=200, thin=2, seed=1000);
##D 
##D rst.sr     <- bzCallStan("sr", dat.sub=subgrp.effect,
##D                         var.estvar=var.estvar, var.cov = var.cov,
##D                         par.pri=c(B=1000, C=1000),
##D                         chains=4, iter=600,
##D                         warmup=200, thin=2, seed=1000);
## End(Not run)



