library(compositions)


### Name: gsi.varwithlosts
### Title: Internal function: computes variance of compositional data set
###   with missing/zero values
### Aliases: gsi.varwithlosts
### Keywords: internal

### ** Examples

# generates a 3-part compositional data set with missings
A <- matrix(c(0.5,0.3,0.1, 0.3,0.2,0, 0.1, 0, 0.75),nrow=3)
Mvar <- 2*ilrvar2clr(A)
Mcenter <- acomp(c(1,5,2,3))
x <- rnorm.acomp(100,Mcenter,Mvar) 
colnames(x)<-c("A","B","C","D")
# eliminate 20 values completely at random
 slost <- sample(1:length(x), size=30)
 x[slost] <- 0
# compute the variance with losts
#print(vr <- gsi.varwithlosts(cdt(x)))
# compare with Mvar



