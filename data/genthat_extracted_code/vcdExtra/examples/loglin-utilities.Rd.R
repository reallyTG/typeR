library(vcdExtra)


### Name: loglin-utilities
### Title: Loglinear Model Utilities
### Aliases: loglin-utilities conditional joint loglin2formula
###   loglin2string markov mutual saturated
### Keywords: models

### ** Examples

joint(3, table=HairEyeColor)
# as a formula or string
loglin2formula(joint(3, table=HairEyeColor))
loglin2string(joint(3, table=HairEyeColor))

joint(2, HairEyeColor)  # marginal model for [Hair] [Eye]

# other possibilities
joint(4, factors=letters, with=1)
joint(5, factors=LETTERS)
joint(5, factors=LETTERS, with=4:5)

conditional(4)
conditional(4, with=3:4)

# use in mosaic displays or other strucplots
mosaic(HairEyeColor, expected=joint(3))
mosaic(HairEyeColor, expected=conditional(3))

# use with MASS::loglm
cond3 <- loglin2formula(conditional(3, table=HairEyeColor))
cond3 <- loglin2formula(conditional(3))  # same, with factors 1,2,3
require(MASS)
loglm(cond3, data=HairEyeColor)

saturated(3, HairEyeColor)
loglin2formula(saturated(3, HairEyeColor))
loglin2string(saturated(3, HairEyeColor))
loglin2string(saturated(3, HairEyeColor), brackets='{}', sep=', ')




