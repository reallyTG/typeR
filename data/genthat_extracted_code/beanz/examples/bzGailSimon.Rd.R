library(beanz)


### Name: bzGailSimon
### Title: Gail-Simon Test
### Aliases: bzGailSimon

### ** Examples

## Not run: 
##D var.cov    <- c("sodium", "lvef", "any.vasodilator.use");
##D var.resp   <- "y";
##D var.trt    <- "trt";
##D var.censor <- "censor";
##D resptype   <- "survival";
##D subgrp.effect <- bzGetSubgrp(solvd.sub,
##D                                   var.resp   = var.resp,
##D                                   var.trt    = var.trt,
##D                                   var.cov    = var.cov,
##D                                   var.censor = var.censor,
##D                                   resptype   = resptype);
##D 
##D gs.pval <- bzGailSimon(subgrp.effect$Estimate,
##D                        subgrp.effect$Variance); 
## End(Not run)





