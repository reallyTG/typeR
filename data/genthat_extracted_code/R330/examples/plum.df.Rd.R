library(R330)


### Name: plum.df
### Title: Plum tree data
### Aliases: plum.df
### Keywords: datasets

### ** Examples

data(plum.df)
plum.glm<-glm(cbind(s,n-s)~length*time, family=binomial, data=plum.df)
summary(plum.glm)




