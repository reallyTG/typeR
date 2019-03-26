library(MultiVarMI)


### Name: MVN.dat
### Title: Computation of Normal Scores for Multivariate Data
### Aliases: MVN.dat

### ** Examples

library(PoisBinOrdNonNor)
n<-1e4
lambdas<-list(1)
mps<-list(c(.2, .8))
moms<-list(c(-1, 1, 0, 1))
  
#generate Poisson, ordinal, and continuous data
cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(3) + .2, 
                               no.pois = length(lambdas), 
                               no.ord = length(mps),
                               no.nonn = length(moms), 
                               pois.list = lambdas, 
                               ord.list = mps, 
                               nonn.list = moms)

mydata <- genPBONN(n, 
                   no.pois = length(lambdas), 
                   no.ord = length(mps), 
                   no.nonn = length(moms),
                   cmat.star = cmat.star, 
                   pois.list = lambdas,
                   ord.list = mps, 
                   nonn.list = moms)

#set a sample of each variable to missing
mydata<-apply(mydata, 2, function(x) {
  x[sample(1:n, size=n/10)]<-NA
  return(x)
})

mydata<-data.frame(mydata)

#get information for use in function
count.info<-countrate(count.dat=data.frame(mydata[,c('X1')]))
ord.info<-ordmps(ord.dat=data.frame(mydata[,c('X2')]))
nct.info<-nctsum(nct.dat=data.frame(mydata[,c('X3')]))

mvn.dat<-MVN.dat(ord.info=ord.info,
                 nct.info=nct.info,
                 count.info=count.info) #outputs in order of continuous, ordinal, count
                   



