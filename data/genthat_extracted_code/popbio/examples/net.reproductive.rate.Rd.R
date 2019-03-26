library(popbio)


### Name: net.reproductive.rate
### Title: Net reproductive rate
### Aliases: net.reproductive.rate
### Keywords: survey

### ** Examples

data(whale)
net.reproductive.rate(whale)
## fertilities in last column
data(teasel)
net.reproductive.rate(teasel, r=1:6, c=6)
## Plot 3 from Calathea - values are not the same as p. 105 in Caswell.
data(calathea)
sapply(calathea[9:12], net.reproductive.rate)




