library(mvabund)


### Name: tikus
### Title: Tikus Island Dataset
### Aliases: tikus
### Keywords: datasets

### ** Examples

require(graphics)

data(tikus)

tikusdat <- as.mvabund(tikus$abund)
tikusid	<- tikus$x
foo	<- mvformula(tikusdat~tikusid[,1] + tikusid[,2])

plot(foo)



