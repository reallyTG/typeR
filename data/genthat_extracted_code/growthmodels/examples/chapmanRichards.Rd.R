library(growthmodels)


### Name: chapmanRichards
### Title: Chapman-Richards growth model
### Aliases: chapmanRichards chapmanRichards.inverse

### ** Examples

growth <- chapmanRichards(0:10, 10, 0.5, 0.3, 0.5)
# Calculate inverse function
time <- chapmanRichards.inverse(growth, 10, 0.5, 0.3, 0.5)



