library(gendata)


### Name: dtrans
### Title: Data Transform
### Aliases: dtrans
### Keywords: transform data

### ** Examples


sdata<-genmvnorm(cor=c(.7,.2,.3),k=3,n=500,seed=12345)
cor(sdata)
summary(sdata)
#note: data are in z scores

s2<-dtrans(sdata,c(0,100,50),c(1,15,10),rnd=FALSE)
summary(s2)
sd(s2[,2])
sd(s2[,3])
#note: variables X2 and X3 are now rescaled with the appropriate means and standard deviations.
head(s2)

s2<-dtrans(sdata,c(0,100,50),c(1,15,10),rnd=TRUE)
#at times, you may want a dataset to not have decimals. use rnd=T.
head(s2)



