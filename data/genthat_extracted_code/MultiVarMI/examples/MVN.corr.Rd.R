library(MultiVarMI)


### Name: MVN.corr
### Title: Calculation of Intermediate Correlation Matrix
### Aliases: MVN.corr

### ** Examples

## No test: 
library(PoisBinOrdNonNor)
n<-1e4
lambdas<-list(1, 3)
mps<-list(c(.2, .8), c(.6, 0, .3, .1))
moms<-list(c(-1, 1, 0, 1), c(0, 3, 0, 2))
  
#generate Poisson, ordinal, and continuous data
cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(6) + .2, 
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
ord.info<-ordmps(ord.dat=mydata[,c('X3', 'X4')])
nct.info<-nctsum(nct.dat=mydata[,c('X5', 'X6')])
count.info<-countrate(count.dat=mydata[,c('X1', 'X2')])

#extract marginal probabilites, continuous properties, and count rates
mps<-sapply(ord.info, "[[", 2)
nctsum<-sapply(nct.info, "[[", 2)
rates<-sapply(count.info, "[[", 2)

#replace continuous with standardized forms
mydata[,c('X5', 'X6')]<-sapply(nct.info, "[[", 1)[,c('X5', 'X6')] 

var.types<-c('C', 'C', 'O', 'O', 'NCT', 'NCT')
mvn.cmat<-MVN.corr(indat=mydata,
                   var.types=var.types,
                   ord.mps=mps,
                   nct.sum=nctsum,
                   count.rate=rates)
## End(No test)



