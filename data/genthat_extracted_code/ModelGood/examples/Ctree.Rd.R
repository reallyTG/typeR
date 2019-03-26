library(ModelGood)


### Name: Ctree
### Title: S3 wrapper function for party's ctree method
### Aliases: Ctree

### ** Examples

library(party)
set.seed(7)
x <- abs(rnorm(20))
d <- data.frame(y=rbinom(20,1,x/max(x)),x=x,z=rnorm(20))
ct <- Ctree(y~x+z,d)
plot(ct$ctree)
predictStatusProb(ct,newdata=d[1:3,])



