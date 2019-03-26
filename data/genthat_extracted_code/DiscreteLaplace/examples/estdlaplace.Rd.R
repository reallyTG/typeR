library(DiscreteLaplace)


### Name: estdlaplace
### Title: Sample estimation for the DSL
### Aliases: estdlaplace
### Keywords: distribution htest

### ** Examples

p<-0.6
q<-0.3
n<-20
x<-rdlaplace(n, p, q)
est<-estdlaplace(x)
est[1]
est[2]
est[3]
# increase n
n<-100
x<-rdlaplace(n, p, q)
est<-estdlaplace(x)
est[1]
est[2]
est[3]
# swap the parameters
x<-rdlaplace(n, q, p)
est<-estdlaplace(x)
est[1]
est[2]
est[3]



