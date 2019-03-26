library(MM)


### Name: paras
### Title: Manipulate a paras object
### Aliases: paras paras-class p p,paras-method p<- p<-,paras-method theta
###   theta<- theta,paras-method theta<-,paras-method pnames
###   pnames,paras-method pnames,MB-method pnames<- pnames<-,paras-method
###   pnames<-,MB-method getVals getVals,paras-method length,paras-method

### ** Examples

jj <- paras(5)
pnames(jj) <- letters[1:5]
p(jj) <- c(0.1, 0.1, 0.3, 0.1)
theta(jj) <- matrix(1:25,5,5)
pnames(jj) <- letters[1:5]
jj

# OK, we've defined jj, now use it with some other functions:
dMM(rep(1,5),jj)
MM_single(1:5,jj)
rMM(2,9,jj)




