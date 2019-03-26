library(emmeans)


### Name: rbind.emmGrid
### Title: Combine or subset 'emmGrid' objects
### Aliases: rbind.emmGrid +.emmGrid [.emmGrid

### ** Examples

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
warp.rg <- ref_grid(warp.lm)

# Show only 3 of the 6 cases
summary(warp.rg[c(2,4,5)])

# Do all pairwise comparisons within rows or within columns, 
# all considered as one faily of tests:
w.t <- pairs(emmeans(warp.rg, ~ wool | tension))
t.w <- pairs(emmeans(warp.rg, ~ tension | wool))
rbind(w.t, t.w, adjust = "mvt")
update(w.t + t.w, adjust = "fdr")  ## same as abve except for adjustment




