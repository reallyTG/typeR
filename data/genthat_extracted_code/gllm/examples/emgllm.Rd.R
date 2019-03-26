library(gllm)


### Name: emgllm
### Title: Generalized log-linear modelling by EM and iterative
###   proportional fitting
### Aliases: emgllm
### Keywords: category models

### ** Examples
 
#
# latent class analysis: two latent classes
#
# Data matrix 2x2x2x2x2 table of responses to five binary items
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
i<-rep(1,64)
x<-as.integer(gl(2,32,64))-1
a<-as.integer(gl(2,16,64))-1
b<-as.integer(gl(2,8 ,64))-1
c<-as.integer(gl(2,4 ,64))-1
d<-as.integer(gl(2,2 ,64))-1
e<-as.integer(gl(2,1 ,64))-1
X<-cbind(i,x,a,b,c,d,e,x*cbind(a,b,c,d,e))
colnames(X)<-c("Int","X","A","B","C","D","E","AX","BX","CX","DX","EX")
res<-emgllm(y,s,X, tol=0.01)
res
#
# Obtain standard errors for parameter estimates
#
summary(scoregllm(y,s,X,as.array(res$full.table)))



