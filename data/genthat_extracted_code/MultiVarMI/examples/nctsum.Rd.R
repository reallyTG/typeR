library(MultiVarMI)


### Name: nctsum
### Title: Summary and Standardization of Continuous Data
### Aliases: nctsum

### ** Examples

library(PoisBinOrdNonNor)
set.seed(123)
n<-1e4

#first four moments for each simulated variable
moms<-list(c(-1, 1, 0, 1), c(0, 3, 0, 2)) 
  
#generate continuous data
cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(2) + .2, 
                               no.nonn = 2, 
                               nonn.list = moms)

nctdata <- genPBONN(n,
                    no.nonn = length(moms),
                    cmat.star = cmat.star, 
                    nonn.list = moms)

#set a sample of each variable to missing
nctdata<-apply(nctdata, 2, function(x) {
  x[sample(1:n, size=n/10)]<-NA
  return(x)
})

nctdata<-data.frame(nctdata)
nctinfo<-nctsum(nctdata)



