library(powerAnalysis)


### Name: ES.chisq.assoc
### Title: Compute effect size of chi-squared test of association
### Aliases: ES.chisq.assoc

### ** Examples

counts <- matrix(c(225,125,85,95),nrow=2,byrow=TRUE)
ES.chisq.assoc(ct=counts)

case <- c(225,85,100)
control <- c(125,95,125)
counts <- cbind(case,control)
ES.chisq.assoc(ct=counts)

p1 <- c(225,85,100)
p2 <- c(125,95,125)
p3 <- c(175,90,113)
counts <- cbind(p1,p2,p3)
ES.chisq.assoc(ct=counts)

ES.chisq.assoc(chisq=13.561,n=530,df=1,mindf=1)

ES.chisq.assoc(p=0.000231,n=530,df=1,mindf=1)



