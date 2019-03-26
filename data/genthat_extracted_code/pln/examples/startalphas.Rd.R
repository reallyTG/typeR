library(pln)


### Name: startalphas
### Title: Starting values for polytymous logit-normit model
### Aliases: startalphas startbetas

### ** Examples


### Raw data
data(item9cat5)

myAlphas<-startalphas(item9cat5, ncat=5)
print(myAlphas)

myBetas<-startbetas(item9cat5, ncat=5)
print(myBetas)

nrbcplnout<-nrbcpln(item9cat5, ncat=5, alphas=myAlphas, betas=myBetas, se=FALSE)
print(nrbcplnout)


### Matrix of response patterns and frequencies
data(item5fr)

myAlphas<-startalphas(item5fr, ncat=3, nitem=5)
print(myAlphas)

myBetas<-startbetas(item5fr, ncat=3, nitem=5)
print(myBetas)

nrbcplnout<-nrbcpln(item5fr, ncat=3, nitem=5, alphas=myAlphas, betas=myBetas, se=FALSE)
print(nrbcplnout)




