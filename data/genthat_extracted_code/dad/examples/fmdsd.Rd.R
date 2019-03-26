library(dad)


### Name: fmdsd
### Title: Multidimensional scaling of probability densities
### Aliases: fmdsd

### ** Examples

data(roses)
rosesfold <- as.folder(roses)

# MDS on Gaussian densities (on sensory data)

# using the Jeffreys measure (default):
resultjeff <- fmdsd(rosesfold, distance = "jeffreys")
print(resultjeff)
plot(resultjeff)

# using the Hellinger distance:
resulthellin <- fmdsd(rosesfold, distance = "hellinger")
print(resulthellin)
plot(resulthellin)

# using the Wasserstein distance:
resultwass <- fmdsd(rosesfold, distance = "wasserstein")
print(resultwass)
plot(resultwass)

# using the L2-distance:
resultl2 <- fmdsd(rosesfold, distance = "l2")
print(resultl2)
plot(resultl2)



