library(gk)


### Name: dgh
### Title: g-and-h distribution functions
### Aliases: dgh pgh g-and-h qgh rgh

### ** Examples

p = 1:9/10 ##Some probabilities
x = qgh(seq(0.1,0.9,0.1), A=3, B=1, g=2, h=0.5) ##g-and-h quantiles
rgh(5, A=3, B=1, g=2, h=0.5) ##g-and-h draws
dgh(x, A=3, B=1, g=2, h=0.5) ##Densities of x under g-and-h
dgh(x, A=3, B=1, g=2, h=0.5, log=TRUE) ##Log densities of x under g-and-h
pgh(x, A=3, B=1, g=2, h=0.5) ##Distribution function of x under g-and-h



