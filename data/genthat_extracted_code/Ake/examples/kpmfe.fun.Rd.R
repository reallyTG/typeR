library(Ake)


### Name: kpmfe.fun
### Title: Function for associated kernel estimation of p.m.f.
### Aliases: kpmfe.fun kpmfe.fun.default

### ** Examples

## A sample data with n=60.
V<-c(10,0,1,0,4,0,6,0,0,0,1,1,1,2,4,4,5,6,6,6,6,7,1,7,0,7,7,
7,8,0,8,12,8,8,9,9,0,9,9,10,10,10,10,0,10,10,11,12,12,10,12,12,
13,14,15,16,16,17,0,12)


##The bandwidth can be the one obtained by cross validation.
h<-0.081
## We choose Binomial kernel.

est<-kpmfe.fun(Vec=V,h,"discrete","bino")
##To obtain the normalizing constant:
est





