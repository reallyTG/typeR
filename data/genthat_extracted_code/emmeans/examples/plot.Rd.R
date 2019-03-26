library(emmeans)


### Name: plot.emmGrid
### Title: Plot an 'emmGrid' or 'summary_emm' object
### Aliases: plot.emmGrid plot.summary_emm

### ** Examples

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
plot(warp.emm)
plot(warp.emm, by = NULL, comparisons = TRUE, adjust = "mvt", 
     horizontal = FALSE)



