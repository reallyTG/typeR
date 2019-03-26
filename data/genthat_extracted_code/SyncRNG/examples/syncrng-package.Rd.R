library(SyncRNG)


### Name: syncrng-package
### Title: SyncRNG - Synchronized Random Numbers in R and Python
### Aliases: syncrng-package

### ** Examples

library(SyncRNG)

# As user defined RNG:

set.seed(0, 'user', 'user')
runif(2)
# [1] 3.666952e-04 6.257184e-05
set.seed(0, 'user', 'user')
rnorm(2)
# [1] 0.01006027 0.42889422

# As class:

s <- SyncRNG(seed=0)
s$rand()
# [1] 0.0003666952
s$rand()
# [1] 6.257184e-05




