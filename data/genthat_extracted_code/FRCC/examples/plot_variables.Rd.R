library(FRCC)


### Name: plot_variables
### Title: Plot variables in the Canonical Factor Loadings Space
### Aliases: plot_variables
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Example: Multivariate Normal Data
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
dev.new()
plot_variables(my_res,1,2,text_size=1.0)



