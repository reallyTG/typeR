library(MultiVarMI)


### Name: countrate
### Title: Computation of Rates for Count Data
### Aliases: countrate

### ** Examples

library(PoisBinOrdNonNor)
set.seed(123)
n<-1e4

lambdas<-list(1, 3)

#generate Poisson data
cmat.star <- find.cor.mat.star(cor.mat = .4 * diag(2) + .6, 
                               no.pois = length(lambdas), 
                               pois.list = lambdas)

cntdata <- genPBONN(n, 
                    no.pois = length(lambdas), 
                    cmat.star = cmat.star, 
                    pois.list = lambdas)

#set a sample of the data to missing
cntdata<-apply(cntdata, 2, function(x) {
  x[sample(1:n, size=n/10)]<-NA
  return(x)
})

cntdata<-data.frame(cntdata)
cntinfo<-countrate(cntdata)



