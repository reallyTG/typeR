library(PASWR)


### Name: FCD
### Title: Fat Cats
### Aliases: FCD
### Keywords: datasets

### ** Examples

# Figure 11.12
FCD.aov <- aov(Weight~Diet, data = FCD)
checking.plots(FCD.aov)
rm(FCD.aov)



