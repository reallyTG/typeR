library(ppls)


### Name: jack.ppls
### Title: Jackknife estimation for PPLS-coefficients
### Aliases: jack.ppls
### Keywords: multivariate

### ** Examples

data(cookie) # load data
X<-as.matrix(cookie[,1:700]) # extract NIR spectra
y<-as.vector(cookie[,701]) # extract one constituent

pls.object<-penalized.pls.cv(X,y,ncomp=10,kernel=TRUE) # PLS without penalization
my.jack<-jack.ppls(pls.object)



