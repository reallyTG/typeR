library(iopsych)


### Name: lMvrrc
### Title: Lawley multivariate range restriction correction.
### Aliases: lMvrrc

### ** Examples

data(rcea1994)
vstar <- rcea1994$vstar
vpp   <- rcea1994$vpp

lMvrrc(rcov=vstar, vnp=vpp)



