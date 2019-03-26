library(gllm)


### Name: gllm
### Title: Generalized log-linear modelling
### Aliases: gllm
### Keywords: category models

### ** Examples
 
#
# latent class analysis: two latent classes
#
# Data matrix 2x2x2x2x2 table of responses to five binary items
# (items 11-15 of sections 6-7 of the Law School Admission Test)
#
y<-c( 3,   6,   2,   11,   1,   1,   3,    4,
      1,   8,   0,   16,   0,   3,   2,   15,
     10,  29,  14,   81,   3,  28,  15,   80,
     16,  56,  21,  173,  11,  61,  28,  298)
#
# Scatter matrix: full table is 2x2x2x2x2x2
#
s<-  c(1:32,1:32)
#
# Design matrix: x is the latent variable (2 levels), 
# a-e are the observed variables
#
x<-as.integer(gl(2,32,64))-1
a<-as.integer(gl(2,16,64))-1
b<-as.integer(gl(2,8 ,64))-1
c<-as.integer(gl(2,4 ,64))-1
d<-as.integer(gl(2,2 ,64))-1
e<-as.integer(gl(2,1 ,64))-1

res1<-gllm(y,s,~x*(a+b+c+d+e),method="em",tol=0.01)
res1
#
# An example of model fitting: gametic association between two diallelic loci
#
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
res2<-gllm(y,s,X[,c(1:6)],method="hybrid",em.maxit=1,tol=0.00001)
res2
#




