library(agricolae)


### Name: waller
### Title: Computations of Bayesian t-values for multiple comparisons
### Aliases: waller
### Keywords: distribution

### ** Examples

# Table Duncan-Waller K=100, F=1.2 pag 649 Steel & Torry
library(agricolae)
K<-100
Fc<-1.2
q<-c(8,10,12,14,16,20,40,100)
f<-c(seq(4,20,2),24,30,40,60,120)
n<-length(q)
m<-length(f)
W.D <-rep(0,n*m)
dim(W.D)<-c(n,m)
for (i in 1:n) {
for (j in 1:m) {
W.D[i,j]<-waller(K, q[i], f[j], Fc)
}}
W.D<-round(W.D,2)
dimnames(W.D)<-list(q,f)
print(W.D)




