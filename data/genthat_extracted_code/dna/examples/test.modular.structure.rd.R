library(dna)


### Name: test.modular.structure
### Title: Test for differential modular structures
### Aliases: test.modular.structure

### ** Examples

# small example illustrating test procedures
X1=rbind(
c(2.5,6.7,4.5,2.3,8.4,3.1),
c(1.2,0.7,4.0,9.1,6.6,7.1),
c(4.3,-1.2,7.5,3.8,1.0,9.3),
c(9.5,7.6,5.4,2.3,1.1,0.2))
colnames(X1)=paste("G",1:6,sep="")

X2=rbind(
c(4.5,2.4,6.8,5.6,4.5,1.2,4.5),
c(7.6,9.0,0.1,3.4,5.6,5.5,1.2),
c(8.3,4.5,7.0,1.2,4.3,3.7,6.8),
c(3.4,1.1,6.9,7.2,3.1,0.9,6.6),
c(3.4,2.2,1.3,5.5,9.8,6.7,0.6))
colnames(X2)=paste("G",8:2,sep="")

# perform a test for modular structure using a minimum module size of 2
# and threshold of .5 with PLS connectivity scores
## Not run: tms=test.modular.structure(X1,X2,min.module.size=2)
## Not run: summary(tms)

# extract results for a test of modular structure
## Not run: results.tms=get.results(tms)
## Not run: results.tms

# perform a test for modular structure using a minimum module size of 2
# and threshold of .5 with PLS connectivity scores without rescaling the data,
# symmetrizing the scores, or rescaling the scores based on 10000 permutations
## Not run: tms2=test.modular.structure(X1,X2,scores="PLS",min.module.size=2,
## num.permutations=10000,rescale.data=FALSE,symmetrize.scores=FALSE,
## rescale.scores=FALSE)
## Not run: summary(tms2)

# perform a test for modular structure using a minimum module size of 2
# and threshold of .5 with correlation connectivity scores
## Not run: tms3=test.modular.structure(X1,X2,scores="cor",min.module.size=2)
## Not run: summary(tms3)

# perform a test for modular structure using a minimum module size of 3
# and threshold of .7 with principal components regression connectivity scores
## Not run: tms4=test.modular.structure(X1,X2,scores="PC",min.module.size=3,
## epsilon=.7)
## Not run: summary(tms4)

# perform a test for modular structure using a minimum module size of 2
# and threshold of .9 with ridge regression connectivity scores with 
# rescaled data, symmetrized and rescaled scores and a penalty parameter 
# equal to 3
## Not run: tms5=test.modular.structure(X1,X2,scores="RR",min.module.size=2,
## epsilon=.5,rescale.scores=TRUE,lambda=3)
## Not run: summary(tms5)

# perform a test for modular structure using a minimum module size of 2 and 
# threshold of .9 with custom ridge regression connectivity scores with 
# centered and rescaled data and symmetrized and rescaled scores
## Not run: ourRR=function(X,y,lambda=3){
## solve(t(X)%*%X+lambda*diag(ncol(X)))%*%t(X)%*%y}
## Not run: ourRRnet=function(X){gennet(X,f=ourRR,recenter.data=TRUE,
## rescale.data=TRUE,symmetrize.scores=TRUE,rescale.scores=TRUE)}
## Not run: tms6=test.modular.structure(X1,X2,scores=ourRRnet,
## min.module.size=2,epsilon=.9)
## Not run: summary(tms6)



