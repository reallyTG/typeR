library(HH)


### Name: lmatRows
### Title: Find the row numbers in the lmat corresponding to the focus
###   factor.
### Aliases: lmatRows lmatRows.mmc.multicomp lmatRows.multicomp
###   lmatRows.glht lmatRows.lm lmatContrast
### Keywords: dplot

### ** Examples

## catalystm example
## See ?MMC for more on this example
data(catalystm)
catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)

catalystm.mmc <-
  if.R(r=mmc(catalystm1.aov, linfct = mcp(catalyst = "Tukey")),
       s=multicomp.mmc(catalystm1.aov, plot=FALSE))
dimnames(catalystm.mmc$mca$lmat)[[1]]
lmatRows(catalystm1.aov, focus="catalyst")

## user-specified contrasts
catalystm.lmat <- cbind("AB-D" =c( 1, 1, 0,-2),
                        "A-B"  =c( 1,-1, 0, 0),
                        "ABD-C"=c( 1, 1,-3, 1))
dimnames(catalystm.lmat)[[1]] <- levels(catalystm$catalyst)
zapsmall(lmatContrast(catalystm.mmc$none$lmat, catalystm.lmat))



