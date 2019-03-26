library(generalCorr)


### Name: comp_portfo2
### Title: Compares two vectors (portfolios) using stochastic dominance of
###   orders 1 to 4.
### Aliases: comp_portfo2
### Keywords: SD1 SD2 SD3 SD4 bigfp dominance stochastic wtdpapb

### ** Examples


set.seed(30)
xa=sample(20:30)#generally lower returns
xb=sample(32:40)# higher returns in xb
gp = comp_portfo2(xa, xb)#all Av(sdi) positive means xb dominates
##positive SD1 to SD4 means xb dominates xa as it should




