library(gaston)


### Name: lmm.simu
### Title: Linear mixed model data simulation
### Aliases: lmm.simu
### Keywords: Simulations

### ** Examples

# generate a random positive matrix 
set.seed(1)
R <- random.pm(503)

# simulate data with a "polygenic component" 
y <-  lmm.simu(0.3, 1, eigenK = R$eigen)
str(y)



