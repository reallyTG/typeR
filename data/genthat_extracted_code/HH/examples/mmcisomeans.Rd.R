library(HH)


### Name: mmcisomeans
### Title: Functions used by mmcplot.
### Aliases: mmcisomeans mmcmatch mmcboth
### Keywords: hplot

### ** Examples

## Not run: 
##D   ## these examples exercise all optional arguments
##D data(catalystm)
##D catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
##D 
##D catalystm.glht <-
##D    glht(catalystm1.aov, linfct = mcp(catalyst = "Tukey"))
##D confint(catalystm.glht)
##D 
##D plot(catalystm.glht)  ## this is the multcomp:::plot.glht
##D 
##D mmcplot(catalystm.glht)  ## mmcplot.glht sends its argument to HH:::as.multicomp.glht with
##D ## the default arguments (estimate.sign = 1, order.contrasts = TRUE) unless overridden:
##D ##
##D mmcplot(catalystm.glht, order.contrasts=FALSE, estimate.sign=0, main="B'")
##D 
##D catalystm.lmat <- cbind("AB-D" =c(1, 1, 0,-2),
##D                         "A-B"  =c(1,-1, 0, 0),
##D                         "ABD-C"=c(1, 1,-3, 1))
##D dimnames(catalystm.lmat)[[1]] <- levels(catalystm$catalyst)
##D catalystm.mmc <-
##D    mmc(catalystm1.aov,
##D        linfct = mcp(catalyst = "Tukey"),
##D        focus.lmat=catalystm.lmat)
##D 
##D mmcplot(catalystm.mmc, type="mca",  style="confint")
##D mmcplot(catalystm.mmc, type="lmat", style="confint")
##D mmcplot(catalystm.mmc, type="none", style="confint")
##D mmcplot(catalystm.mmc, type="none", style="confint", xlim.match=FALSE,
##D         main="xlim.match=FALSE is default for none confint")
##D mmcplot(catalystm.mmc, type="none", style="confint", xlim.match=TRUE, main="out of bounds")
##D 
##D mmcplot(catalystm.mmc$mca,  style="confint")
##D mmcplot(catalystm.mmc$lmat, style="confint")
##D mmcplot(catalystm.mmc$none, style="confint")
##D 
##D plot(catalystm.mmc) ## HH:::plot.mmc.multicomp method
##D 
##D mmcplot(catalystm.mmc)
##D 
##D mmcplot(catalystm.mmc)
##D mmcplot(catalystm.mmc, style="isomeans")
##D mmcplot(catalystm.mmc, style="confint")
##D mmcplot(catalystm.mmc, style="both")
##D 
##D mmcplot(catalystm.mmc, style="isomeans", type="mca")
##D mmcplot(catalystm.mmc, style="isomeans", type="lmat")
##D mmcplot(catalystm.mmc, style="isomeans", type="linfct")
##D mmcplot(catalystm.mmc, style="isomeans", type="none")
##D mmcplot(catalystm.mmc, style="isomeans", type="none", xlim.match=FALSE)
##D 
##D mmcplot(catalystm.mmc, style="confint",  type="mca")
##D mmcplot(catalystm.mmc, style="confint",  type="lmat")
##D mmcplot(catalystm.mmc, style="confint",  type="linfct")
##D mmcplot(catalystm.mmc, style="confint",  type="none")
##D mmcplot(catalystm.mmc, style="confint",  type="none", xlim.match=FALSE)
##D 
##D mmcplot(catalystm.mmc, style="both",     type="mca")
##D mmcplot(catalystm.mmc, style="both",     type="lmat")
##D mmcplot(catalystm.mmc, style="both",     type="linfct")
##D mmcplot(catalystm.mmc, style="both",     type="none")
##D mmcplot(catalystm.mmc, style="both",     type="none", xlim.match=FALSE)
##D 
##D mmcplot(catalystm.mmc$mca)
##D mmcplot(catalystm.mmc$mca$glht)
##D mmcplot(catalystm.mmc$none)
##D mmcplot(catalystm.mmc$none$glht)
##D mmcplot(catalystm.mmc$lmat)
##D mmcplot(catalystm.mmc$lmat$glht)
##D 
##D mmcplot(catalystm.mmc, type="none")
##D mmcplot(catalystm.mmc, type="none", xlim.match=FALSE)
##D mmcplot(catalystm.mmc$none)
## End(Not run)



