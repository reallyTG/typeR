library(psych)


### Name: splitHalf
### Title: Alternative estimates of test reliabiity
### Aliases: splitHalf guttman tenberge glb glb.fa
### Keywords: multivariate

### ** Examples

data(attitude)
splitHalf(attitude)
splitHalf(attitude,covar=TRUE) #do it on the covariances
glb(attitude)
glb.fa(attitude)
if(require(Rcsdp)) {glb.algebraic(cor(attitude)) }
guttman(attitude)

#to show the histogram of all possible splits for the ability test
#sp <- splitHalf(ability,raw=TRUE)  #this saves the results
#hist(sp$raw,breaks=101,ylab="SplitHalf reliability",main="SplitHalf 
#    reliabilities of a test with 16 ability items")
sp <- splitHalf(bfi[1:10],key=c(1,9,10))




