library(ordPens)


### Name: ordAOV
### Title: ANOVA for factors with ordered levels
### Aliases: ordAOV
### Keywords: anova

### ** Examples

# load some data
data(ICFCoreSetCWP)

# the pysical health component summary
y <- ICFCoreSetCWP$phcs

# consider the first ordinal factor
x <- ICFCoreSetCWP[,1]

# adequate coding
x <- as.integer(x - min(x) + 1)

# ANOVA
ordAOV(x, y, type = "RLRT", nsim=1000000)



