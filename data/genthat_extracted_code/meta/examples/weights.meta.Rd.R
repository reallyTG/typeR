library(meta)


### Name: weights.meta
### Title: Calculate absolute and percentage weights for meta-analysis
### Aliases: weights.meta

### ** Examples

data(Fleiss93cont)
#
# Do meta-analysis (fixed effect and random effects model)
#
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, study,
                  data=Fleiss93cont, sm="SMD")
#
# Print weights for fixed effect and random effects meta-analysis
#
weights(meta1)

#
# Do meta-analysis (only random effects model)
#
meta2 <- update(meta1, comb.fixed = FALSE)
#
# Print weights for random effects meta-analysis
#
weights(meta2)
#
# Print weights for fixed effect and random effects meta-analysis
#
weights(meta2, comb.fixed = TRUE)



