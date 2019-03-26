library(R330)


### Name: traffic.df
### Title: Highway accdient rates
### Aliases: traffic.df
### Keywords: datasets

### ** Examples

data(traffic.df)
traffic.lm<-lm(rate~.,data=traffic.df)
summary(traffic.lm)



