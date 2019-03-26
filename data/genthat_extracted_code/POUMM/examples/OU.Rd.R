library(POUMM)


### Name: OU
### Title: Distribution of an Ornstein-Uhlenbeck Process at Time t, Given
###   Initial State at Time 0
### Aliases: OU dOU rOU meanOU varOU sdOU

### ** Examples

z0 <- 8
t <- 10
n <- 100000
sample <- rOU(n, z0, t, 2, 3, 1)
dens <- dOU(sample, z0, t, 2, 3, 1)
var(sample)  # around 1/4
varOU(t, 2, 1) 




