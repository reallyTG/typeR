library(gendata)


### Name: genmvnorm
### Title: Genmvnorm
### Aliases: genmvnorm
### Keywords: montecarlo synthetic

### ** Examples

sdata<-genmvnorm(cor=c(.7,.2,.3),k=3,n=500,seed=12345)
cor(sdata)
#dataset above uses the lower half of a correlation table
#     1  .7  .2
#     .7  1  .3
#     .2 .3   1
# Can also use a correlation table

data(iris)
dat<-cor(iris[,1:3])
dat
sdata<-genmvnorm(cor=dat,k=3,n=100,seed=123)
cor(sdata)

#example above uses the IRIS dataset.



