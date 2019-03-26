library(gllm)


### Name: scoregllm
### Title: Generalized log-linear modelling via Fisher scoring
### Aliases: scoregllm
### Keywords: models category

### ** Examples
 
#
# An example of model fitting: gametic association between two diallelic loci
# Data matrix
#
y<-c( 187,386,156,
      352,310,20,
      136,0  ,0)
#
# Scatter matrix
#
s<-  c( 1, 2, 2, 3,
        4, 5, 5, 6,
        4, 5, 5, 6,
        7, 8, 8, 9)
#
# Design matrix
#
X<-  matrix(c( 1,0,0,0,0,0,1,
               1,0,1,0,0,0,0,
               1,0,1,0,0,0,0,
               1,0,2,0,1,0,0,
               1,1,0,0,0,0,0,
               1,1,1,0,0,1,0,
               1,1,1,0,0,0,1,
               1,1,2,0,1,1,1,
               1,1,0,0,0,0,0,
               1,1,1,0,0,0,1,
               1,1,1,0,0,1,0,
               1,1,2,0,1,1,1,
               1,2,0,1,0,0,0,
               1,2,1,1,0,1,1,
               1,2,1,1,0,1,1,
               1,2,2,1,1,2,2), byrow=TRUE, ncol=7) 

colnames(X)<-c("Intercept", "A", "B", "P1", "P2", "Delta", "Epsilon")
res<-scoregllm(y,s,X[,c(1:6)], 
               c(255,176,176,121,164,37,113,25,164,113,37,25,90,20,20,5))
summary(res)
#




