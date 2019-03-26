library(emmeans)


### Name: contrast-methods
### Title: Contrast families
### Aliases: contrast-methods pairwise.emmc emmc-functions revpairwise.emmc
###   tukey.emmc poly.emmc trt.vs.ctrl.emmc trt.vs.ctrl1.emmc
###   trt.vs.ctrlk.emmc dunnett.emmc eff.emmc del.eff.emmc consec.emmc
###   mean_chg.emmc

### ** Examples

warp.lm <- lm(breaks ~ wool*tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
contrast(warp.emm, "poly")
contrast(warp.emm, "trt.vs.ctrl", ref = "M")

# Compare only low and high tensions
# Note pairs(emm, ...) calls contrast(emm, "pairwise", ...)
pairs(warp.emm, exclude = 2)
# (same results using exclude = "M" or include = c("L","H") or include = c(1,3))

### Setting up a custom contrast function
helmert.emmc <- function(levs, ...) {
    M <- as.data.frame(contr.helmert(levs))
    names(M) <- paste(levs[-1],"vs earlier")
    attr(M, "desc") <- "Helmert contrasts"
    M
}
contrast(warp.emm, "helmert")
## Not run: 
##D # See what is used for polynomial contrasts with 6 levels
##D emmeans:::poly.emmc(1:6)
## End(Not run)



