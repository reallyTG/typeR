library(beanz)


### Name: bzGetSubgrpRaw
### Title: Get subgroup treatment effect estimation and variance
### Aliases: bzGetSubgrpRaw

### ** Examples


## Not run: 
##D var.cov    <- c("sodium", "lvef", "any.vasodilator.use");
##D var.resp   <- "y";
##D var.trt    <- "trt";
##D var.censor <- "censor";
##D resptype   <- "survival";
##D subgrp.effect <- bzGetSubgrpRaw(solvd.sub,
##D                                   var.resp   = var.resp,
##D                                   var.trt    = var.trt,
##D                                   var.cov    = var.cov,
##D                                   var.censor = var.censor,
##D                                   resptype   = resptype);
## End(Not run)




