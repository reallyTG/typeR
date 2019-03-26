library(MVTests)


### Name: OneSampleHT2
### Title: One Sample Hotelling T^2 Test
### Aliases: OneSampleHT2

### ** Examples

data(iris)

mean0<-c(6,3,1,0.25)
result <- OneSampleHT2(data=iris[1:50,-5],mu0=mean0,alpha=0.05)
summary(result)



