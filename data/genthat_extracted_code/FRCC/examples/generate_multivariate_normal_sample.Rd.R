library(FRCC)


### Name: generate_multivariate_normal_sample
### Title: It generates a sample from a multinormal distribution function
### Aliases: generate_multivariate_normal_sample
### Keywords: ~kwd1 ~kwd2

### ** Examples

p<-10
q<-10
n<-50
res<-generate_multivariate_normal_sample(p,q,n)
X<-res$X
Y<-res$Y
rownames(X)<-c(1:n)
colnames(X)<-c(1:p)
colnames(Y)<- c(1:q)
my_res<-frcc(X,Y)



