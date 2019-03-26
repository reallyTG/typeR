library(emmeans)


### Name: CLD
### Title: Extract and display information on all pairwise comparisons of
###   least-squares means.
### Aliases: CLD CLD.emmGrid cld.emmGrid

### ** Examples

warp.lm <- lm(breaks ~ wool * tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
CLD(warp.emm)                  # implicitly uses by = "wool"
CLD(warp.emm, by = "tension")  # overrides implicit 'by'

# Mimic grouping bars and compare all 6 means
CLD(warp.emm, by = NULL, Letters = "||||||||", alpha = .01)



