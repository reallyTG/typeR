library(emmeans)


### Name: emm
### Title: Support for 'multcomp::glht'
### Aliases: emm glht-support glht.emmGrid glht.emmlf modelparm.emmwrap
###   as.glht as.glht.emmGrid

### ** Examples

if(require(multcomp)) { # --- multcomp must be installed

warp.lm <- lm(breaks ~ wool*tension, data = warpbreaks)

# Using 'emm'
summary(glht(warp.lm, emm(pairwise ~ tension | wool)))

# Same, but using an existing 'emmeans' result
warp.emm <- emmeans(warp.lm, ~ tension | wool)
summary(as.glht(pairs(warp.emm)))

# Same contrasts, but treat as one family
summary(as.glht(pairs(warp.emm), by = NULL))

} # --- was tested only if multcomp is installed



