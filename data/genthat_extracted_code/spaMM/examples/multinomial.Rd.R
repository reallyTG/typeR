library(spaMM)


### Name: multinomial
### Title: Analyzing multinomial data
### Aliases: multinomial binomialize multi fitted.HLfitlist
###   logLik.HLfitlist
### Keywords: family model manip

### ** Examples

## An example considering pseudo-data at one diploid locus for 50 individuals 
set.seed(123)
genecopy1 <- sample(4,size=50,prob=c(1/2,1/4,1/8,1/8),replace=TRUE)
genecopy2 <- sample(4,size=50,prob=c(1/2,1/4,1/8,1/8),replace=TRUE)
alleles <- c("122","124","126","128")
genotypes <- data.frame(type1=alleles[genecopy1],type2=alleles[genecopy2])
## Columns "type1","type2" each contains an allele type => input is "types" (the default)
datalist <- binomialize(genotypes,responses=c("type1","type2"))

## two equivalent fits:
f1 <- HLfit(cbind(npos,nneg)~1,data=datalist, family=binomial())
f2 <- HLfit(cbind(npos,nneg)~1,data=genotypes, family=multi(responses=c("type1","type2")))
fitted(f2)

## distinct fits for spatial data
## Not run: 
##D genoInSpace <- data.frame(type1=alleles[genecopy1],type2=alleles[genecopy2],x=runif(50),y=runif(50))
##D ## Fitting distinct variances of random effects for each binomial response
##D corrHLfit(cbind(npos,nneg)~1+Matern(1|x+y),data=genoInSpace, 
##D           family=multi(responses=c("type1","type2")),
##D           ranFix=list(rho=1,nu=0.5))
##D ## Fitting the same variance for all binomial responses           
##D corrHLfit(cbind(npos,nneg)~1+Matern(1|x+y),data=genoInSpace, 
##D           family=multi(responses=c("type1","type2")),
##D           ranFix=list(rho=1,nu=0.5),init.corrHLfit=list(lambda=1))
## End(Not run)



