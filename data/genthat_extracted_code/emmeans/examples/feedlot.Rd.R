library(emmeans)


### Name: feedlot
### Title: Feedlot data
### Aliases: feedlot
### Keywords: datasets

### ** Examples

feedlot.lm <- lm(swt ~ ewt + herd*diet, data = feedlot)

# Obtain EMMs with a separate reference value of ewt for each 
# herd. This reproduces the last part of Table 2 in the reference
emmeans(feedlot.lm,  ~ diet | herd,  cov.reduce = ewt ~ herd)




