library(MSnbase)


### Name: npcv
### Title: Non-parametric coefficient of variation
### Aliases: npcv

### ** Examples

set.seed(1)
npcv(rnorm(10))
replicate(10, npcv(rnorm(10)))
npcv(1)
mad(1)
sd(1)



