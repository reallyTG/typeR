library(concor)


### Name: concor
### Title: Relative links of several subsets of variables
### Aliases: concor

### ** Examples

# To make some "GPA" : so, by posing the compromise X = Y,
# "procrustes" rotations to the "compromise X" then are :
# Yj*(vj*u').

x<-matrix(runif(50),10,5);y<-matrix(runif(90),10,9)
x<-scale(x);y<-scale(y)
co<-concor(x,y,c(3,2,4),2)
((t(x%*%co$u[,1])%*%y[,1:3]%*%co$v[1:3,1])/10)^2;co$cov2[1,1] 
t(x%*%co$u)%*%y%*%co$V



