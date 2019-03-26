library(MultiVarMI)


### Name: MI
### Title: Bayesian Multiple Imputation for Multivariate Data
### Aliases: MI

### ** Examples

## No test: 
library(PoisBinOrdNonNor)
set.seed(1234)
n<-1e5
lambdas<-list(1, 3) #2 count variables
mps<-list(c(.2, .8), c(.6, 0, .3, .1)) #1 binary variable, 1 ordinal variable with skip pattern
moms<-list(c(-1, 1, 0, 1), c(0, 3, 0, 2)) #2 continuous variables

################################################
#Generate Poisson, Ordinal, and Continuous Data#
################################################
#get intermediate correlation matrix
cmat.star <- find.cor.mat.star(cor.mat = .8 * diag(6) + .2, #all pairwise correlations set to 0.2
                               no.pois = length(lambdas),
                               no.ord = length(mps),
                               no.nonn = length(moms),
                               pois.list = lambdas,
                               ord.list = mps,
                               nonn.list = moms)

#generate dataset
mydata <- genPBONN(n,
                   no.pois = length(lambdas),
                   no.ord = length(mps),
                   no.nonn = length(moms),
                   cmat.star = cmat.star,
                   pois.list = lambdas,
                   ord.list = mps,
                   nonn.list = moms)

cor(mydata)
apply(mydata, 2, mean)

#Make 10 percent of each variable missing completely at random
mydata<-apply(mydata, 2, function(x) {
  x[sample(1:n, size=n*0.1)]<-NA
  return(x) 
  }
)


#Create 5 imputed datasets
mydata<-data.frame(mydata)
mymidata<-MI(dat=mydata,
             var.types=c('C', 'C', 'O', 'O', 'NCT', 'NCT'),
             m=5)

#get the means of each variable for the m imputed datasets  
do.call(rbind, lapply(mymidata, function(x) apply(x, 2, mean)))

#get m correlation matrices of for the m imputed dataset
lapply(mymidata, function(x) cor(x))

#Look at the second imputed dataset
head(mymidata$dataset2)

##run a linear model on each dataset and extract coefficients
mycoef<-lapply(mymidata, function(x) {
  fit<-lm(X6~., data=data.frame(x))
  fit.coef<-coef(fit)
  return(fit.coef)
})

do.call(rbind, mycoef)
## End(No test)



