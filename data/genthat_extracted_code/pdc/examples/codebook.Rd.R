library(pdc)


### Name: codebook
### Title: Codebook
### Aliases: codebook

### ** Examples


# calculate codebook from sine-wave
cb <- codebook(c(sin(1:100)),m=3)

# plot the permutation distribution
barplot(cb,xlab="Permutation Distribution")




