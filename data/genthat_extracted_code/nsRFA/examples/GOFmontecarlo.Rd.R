library(nsRFA)


### Name: GOFmontecarlo
### Title: Goodness of fit tests
### Aliases: GOFmontecarlo gofNORMtest gofEXPtest gofGUMBELtest
###   gofGENLOGIStest gofGENPARtest gofGEVtest gofLOGNORMtest gofP3test
### Keywords: htest

### ** Examples

x <- rnorm(30,10,1)
gofNORMtest(x)

x <- rand.gamma(50, 100, 15, 7)
gofP3test(x, Nsim=200)

x <- rand.GEV(50, 0.907, 0.169, 0.0304)
gofGEVtest(x, Nsim=200)

x <- rand.genlogis(50, 0.907, 0.169, 0.0304)
gofGENLOGIStest(x, Nsim=200)

x <- rand.genpar(50, 0.716, 0.418, 0.476)
gofGENPARtest(x, Nsim=200)

x <- rand.lognorm(50, 0.716, 0.418, 0.476)
gofLOGNORMtest(x, Nsim=200)




