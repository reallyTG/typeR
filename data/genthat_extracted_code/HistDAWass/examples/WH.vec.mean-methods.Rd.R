library(HistDAWass)


### Name: WH.vec.mean
### Title: Method WH.vec.mean
### Aliases: WH.vec.mean WH.vec.mean,MatH-method

### ** Examples

hmean<-WH.vec.mean(BLOOD)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD)*get.MatH.ncols(BLOOD))
hmean<-WH.vec.mean(BLOOD,w=RN)



