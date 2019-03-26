library(emmeans)


### Name: contrast
### Title: Contrasts and linear functions of EMMs
### Aliases: contrast contrast.emmGrid pairs.emmGrid coef.emmGrid

### ** Examples

warp.lm <- lm(breaks ~ wool*tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
contrast(warp.emm, "poly")    # inherits 'by = "wool"' from warp.emm
pairs(warp.emm)               # ditto
contrast(warp.emm, "eff", by = NULL)  # contrasts of the 6 factor combs
pairs(warp.emm, simple = "wool") # same as pairs(warp.emm, by = "tension")

# Do all "simple" comparisons, combined into one family
pairs(warp.emm, simple = "each", combine = TRUE)

## Not run: 
##D 
##D ## Note that the following are NOT the same:
##D contrast(warp.emm, simple = c("wool", "tension"))
##D contrast(warp.emm, simple = list("wool", "tension"))
##D ## The first generates contrasts for combinations of wool and tension
##D ##   (same as by = NULL)
##D ## The second generates contrasts for wool by tension, and for 
##D ##   tension by wool, respectively.
## End(Not run)

# An interaction contrast for tension:wool
tw.emm <- contrast(warp.emm, interaction = c("poly", "consec"), by = NULL)
tw.emm          # see the estimates
coef(tw.emm)    # see the contrast coefficients



