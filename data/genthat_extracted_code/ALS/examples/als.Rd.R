library(ALS)


### Name: als
### Title: alternating least squares multivariate curve resolution
###   (MCR-ALS)
### Aliases: als
### Keywords: optimize

### ** Examples

## load 2 matrix datasets into variables d1 and d2
## load starting values for elution profiles
## into variables Cstart1 and Cstart2
## load time labels as x, m/z values as x2
data(multiex)

## starting values for elution profiles
matplot(x,Cstart1,type="l")
matplot(x,Cstart2,type="l",add=TRUE)

## using MCR-ALS, improve estimates for mass spectra S and the two
## matrices of elution profiles
## apply unimodality constraints to the elution profile estimates
## note that the starting estimates for S just contain a dummy matrix

test0 <- als(CList=list(Cstart1,Cstart2),S=matrix(1,nrow=400,ncol=2),
PsiList=list(d1,d2), x=x, x2=x2, uniC=TRUE, normS=0)

## plot the estimated mass spectra 
plotS(test0$S,x2)

## the known mass spectra are contained in the variable S
## can compare the matching factor of each estimated spectrum to
## that in S
matchFactor(S[,1],test0$S[,1])
matchFactor(S[,2],test0$S[,2])
 
## plot the estimated elution profiles
## this shows the relative abundance of the 2nd component is low 
matplot(x,test0$CList[[1]],type="l")
matplot(x,test0$CList[[2]],type="l",add=TRUE)



