library(MixSim)


### Name: MixGOM
### Title: Mixture Simulation based on generalized overlap of Maitra
### Aliases: MixGOM
### Keywords: cluster datagen

### ** Examples

set.seed(1234)

# controls average and maximum overlaps
(ex.1 <- MixGOM(goMega = 0.05, K = 4, p = 5))

# controls maximum overlap
(ex.2 <- MixGOM(goMega = 0.15, K = 4, p = 5, sph = TRUE))



