library(HistDAWass)


### Name: WH.vec.sum
### Title: Method WH.vec.sum
### Aliases: WH.vec.sum WH.vec.sum,MatH-method

### ** Examples

hsum<-WH.vec.sum(BLOOD)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD)*get.MatH.ncols(BLOOD))
hsum<-WH.vec.sum(BLOOD,w=RN)



