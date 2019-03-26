library(ppls)


### Name: ttest.ppls
### Title: T-Test for regression coefficients
### Aliases: ttest.ppls
### Keywords: model

### ** Examples

data(cookie) # load data
X<-as.matrix(cookie[,1:700]) # extract NIR spectra
y<-as.vector(cookie[,701]) # extract one constituent

pls.object<-penalized.pls.cv(X,y,ncomp=10,kernel=TRUE) # PLS without penalization
my.ttest<-ttest.ppls(pls.object) # test for the cv-optimal model

plot(sort(my.ttest$pvalues),type="l",ylab="sorted pvalues") # plot sorted p-values



