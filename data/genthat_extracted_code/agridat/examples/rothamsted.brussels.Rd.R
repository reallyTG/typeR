library(agridat)


### Name: rothamsted.brussels
### Title: Yield of brussels sprouts, RCB with 9 fertilizer treatments
### Aliases: rothamsted.brussels

### ** Examples


data(rothamsted.brussels)
dat <- rothamsted.brussels

require(lattice)
bwplot(yield~trt, dat, main="rothamsted.brussels")

if(require(desplot)){
  desplot(yield~col*row, data=dat,
          num=trt, out1=block, cex=1, # aspect unknown
          main="rothamsted.brussels")
}




