library(eva)


### Name: gpdPbScore
### Title: GPD Parametric Bootstrap Score Test
### Aliases: gpdPbScore

### ** Examples

## Generate some data from GPD
x <- rgpd(200, loc = 0, scale = 1, shape = 0.2)
gpdPbScore(x, bootnum = 100)



