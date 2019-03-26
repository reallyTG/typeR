library(jointseg)


### Name: randomProfile
### Title: Generate a random multi-dimensional profile with breakpoints and
###   noise
### Aliases: randomProfile

### ** Examples


len <- 1e4
nBkp <- 10
noiseLevel <- 1
dim <- 2

sim <- randomProfile(len, nBkp, noiseLevel, dim)
res <- doGFLars(sim$profile, K=5*nBkp)
str(res)




