library(aucm)


### Name: simulations
### Title: Simulate datasets
### Aliases: simulations sim.dat.1 sim.MH1 sim.MH11 sim.MH2 sim.NL1 sim.YH1
###   sim.YH2 sim.d20c sim.disc sim.easy sim.p1 sim.ring skin.orange sim.NL
###   sim.mix sim.pepe.2

### ** Examples


dat = sim.dat.1(n=100,seed=1)
nrow(dat)

dat = sim.dat.1(n=100,seed=1,add.outliers=TRUE)
nrow(dat)




