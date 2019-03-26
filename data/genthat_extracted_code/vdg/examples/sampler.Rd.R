library(vdg)


### Name: sampler
### Title: Sampler Function
### Aliases: sampler

### ** Examples

## Default spherical design region
set.seed(1896)
samp1 <- sampler(n = 100, design = expand.grid(x = -1:1, y = -1:1))
plot(samp1)

## Supplying a custom sampling function based on lhs::improvedLHS()
library("lhs")
sfun <- function(n, k, dup = 1) 2 * improvedLHS(n, k, dup = dup) - 1
samp2 <- sampler(n = 100, design = expand.grid(x = -1:1, y = -1:1),
                 type = "custom", custom.fun = sfun)
plot(samp2)



