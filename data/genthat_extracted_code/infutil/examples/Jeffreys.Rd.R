library(infutil)


### Name: Jeffreys
### Title: Jeffreys Prior and Normalizing Constant
### Aliases: Jeffreys
### Keywords: distributions models

### ** Examples

# using an ltm object
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

jp.lsat <- Jeffreys(ltm.lsat)
jp.lsat(0)

# using inf.mat
inf.lsat <- plot(ltm.lsat, type="IIC", item=0, plot=FALSE, z=seq(-15, 15, length=10000))

jp.lsat <- Jeffreys(inf.mat=inf.lsat)
jp.lsat(0)

# returning normalizing constant
Jeffreys(ltm.lsat, return="nc")
Jeffreys(inf.mat=inf.lsat, return="nc")




