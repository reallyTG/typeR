library(binGroup)


### Name: sDesign
### Title: Iterate Group Size for a One-Parameter Group Testing Problem
### Aliases: sDesign
### Keywords: htest

### ** Examples


## Assume that objective is to show that a proportion
## is smaller than 0.005 (i.e. 0.5%) with a 
## power of 0.80 (i.e. 80%) if the unknown proportion
## in the population is 0.003 (i.e. 0.3%), thus a 
## delta = 0.002 shall be detected. A 95-per-cent 
## Clopper-Pearson CI (corresponding to an exact test)
## shall be used. The maximal number of groups might 
## be 30 where the assay sensitivity is not limited 
## until groupsize s = 100.

sDesign(smax=100, n=30, delta=0.002, p.hyp=0.005,
 alternative="less", method="CP", power=0.8)

## One might accept to detect delta=0.004,
## i.e. accepting to reject H0: p>=0.005 with 
## power 80 per cent when the true proportion is 0.001:

sDesign(smax=100, n=30, delta=0.004, p.hyp=0.005,
 alternative="less", method="CP", power=0.8)

sDesign(smax=100, n=30, delta=0.004, p.hyp=0.005,
 alternative="less", method="Score", power=0.8)




