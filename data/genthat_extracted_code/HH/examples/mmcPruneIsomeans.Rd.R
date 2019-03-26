library(HH)


### Name: mmcPruneIsomeans
### Title: MMC plots in lattice-suppress isomeans grid lines for specified
###   levels of the factor.
### Aliases: mmcPruneIsomeans
### Keywords: hplot

### ** Examples

## needed
## Not run: 
##D ## See file hh/scripts/hh2/tway.R for the complete example.
##D ## A better example is needed for the .Rd documentation.
##D ## possibly based on filmcoat temperature | pressure example.
##D data(rhiz.clover)
##D c(1,2,5,10,11,12)
##D rhiz.clover$cs <- with(rhiz.clover, interaction(comb, strain))
##D rhiz.clover.cs.aov <- aov(Npg ~ cs, data=rhiz.clover)
##D rhiz.clover.cs.aov
##D cs.mmc <- mmc(rhiz.clover.cs.aov, linfct=mcp(cs="Tukey"),
##D               calpha=qtukey( .95, 6,  48)/sqrt(2))
##D dlmat2 <- dimnames(cs.mmc$mca$lmat)[[2]]
##D cl.index <- grep("clover\.[[:print:]]*clover\.", dlmat2, value=TRUE)
##D cl.index
##D clover.lmat <- cs.mmc$mca$lmat[, cl.index] ## suppress "clover+alfalfa" contrasts
##D dimnames(clover.lmat)[[1]]
##D dimnames(clover.lmat)[[1]] <- levels(rhiz.clover$cs)
##D clover.lmat[1,] <- -colSums(clover.lmat[-1, ])
##D clover.lmat
##D csc.mmc <- mmc(rhiz.clover.cs.aov, linfct=mcp(cs="Tukey"),
##D                focus.lmat=clover.lmat,
##D                calpha=qtukey( .95, 6,  48)/sqrt(2))
##D ## this example needs a window 11 inches high and 14 inches wide
##D mmcplot(csc.mmc, type="lmat", style="both")
##D 
##D ## suppress "clover+alfalfa" means
##D csc.mmc.clover <- mmcPruneIsomeans(csc.mmc, keep = c(1,2,5,10,11,12))
##D csc.mmc.clover
##D ## this example needs a window 11 inches high and 14 inches wide
##D mmcplot(csc.mmc.clover, type="lmat", style="both")
## End(Not run)



