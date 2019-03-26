library(WWGbook)


### Name: rat.brain
### Title: rat.brain data in Chapter 5
### Aliases: rat.brain
### Keywords: datasets

### ** Examples

attach(rat.brain)

region.f <- region
region.f[region == 1] <- 1
region.f[region == 2] <- 2
region.f[region == 3] <- 0
region.f <- factor(region.f)
treat <- treatment
treat[treatment == 1] <- 0
treat[treatment == 2] <- 1
treat <- factor(treat)
detach(rat.brain)
rat.brain <- data.frame(rat.brain, region.f, treat)
str(rat.brain)



