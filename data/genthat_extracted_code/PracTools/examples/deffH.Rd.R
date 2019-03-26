library(PracTools)


### Name: deffH
### Title: Henry design effect for _pps_ sampling and GREG estimation of
###   totals
### Aliases: deffH
### Keywords: methods survey

### ** Examples

set.seed(-500398777)
    # generate population using HMT function
pop.dat <- as.data.frame(HMT())
mos <- pop.dat$x
pop.dat$prbs.1d <- mos / sum(mos)
    # select pps sample
require(sampling)
n <- 80
pk <- n * pop.dat$prbs.1d
sam <- UPrandomsystematic(pk)
sam <- sam==1
sam.dat <- pop.dat[sam, ]
dsgn.wts <- 1/pk[sam]
deffH(w=dsgn.wts, y=sam.dat$y, x=sam.dat$x)



