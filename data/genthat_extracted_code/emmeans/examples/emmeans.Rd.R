library(emmeans)


### Name: emmeans
### Title: Estimated marginal means (Least-squares means)
### Aliases: emmeans

### ** Examples

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
emmeans (warp.lm,  ~ wool | tension)
# or equivalently emmeans(warp.lm, "wool", by = "tension")

emmeans (warp.lm, poly ~ tension | wool)

## Not run: 
##D   ### Offsets: Consider a silly example:
##D   emmeans(warp.lm, ~ tension | wool, offset = c(17, 23, 47)) @ grid
##D   # note that offsets are recycled so that each level of tension receives
##D   # the same offset for each wool.
##D   # But using the same offsets with ~ wool | tension will probably not
##D   # be what you want because the ordering of combinations is different.
## End(Not run)



