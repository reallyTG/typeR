library(sparr)


### Name: multiscale.density
### Title: Multi-scale adaptive kernel density/intensity estimation
### Aliases: multiscale.density msden

### ** Examples

## No test: 
data(chorley) # Chorley-Ribble data (package 'spatstat')
ch.multi <- multiscale.density(chorley,h0=1)
plot(ch.multi)

ch.pilot <- bivariate.density(chorley,h0=0.75) # with pre-defined pilot density
ch.multi2 <- multiscale.density(chorley,h0=1,pilot.density=ch.pilot$z)
plot(ch.multi2)

data(pbc)
# widen h0 scale, increase z-axis resolution
pbc.multi <- multiscale.density(pbc,h0=2,hp=1,h0fac=c(0.25,2.5),dimz=128) 
plot(pbc.multi)
## End(No test)



