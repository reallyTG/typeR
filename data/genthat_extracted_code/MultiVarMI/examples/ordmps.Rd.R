library(MultiVarMI)


### Name: ordmps
### Title: Computation of Marginal Probabilities for Binary and Ordinal
###   Data
### Aliases: ordmps

### ** Examples

library(PoisBinOrdNonNor)
set.seed(123)
n<-1e4
mps<-list(c(.2, .8), c(.6, 0, .3, .1))

#generate ordinal data
cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(2) + .2, 
                               no.ord = length(mps),
                               ord.list = mps)

orddata <- genPBONN(n, 
                    no.ord = length(mps), 
                    cmat.star = cmat.star, 
                    ord.list = mps)

#set a sample of each variable to missing
orddata<-apply(orddata, 2, function(x) {
  x[sample(1:n, size=n/10)]<-NA
  return(x)
})

orddata<-data.frame(orddata)
ordinfo<-ordmps(orddata)



