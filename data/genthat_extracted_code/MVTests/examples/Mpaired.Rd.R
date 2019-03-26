library(MVTests)


### Name: Mpaired
### Title: Multivariate Paired Test
### Aliases: Mpaired

### ** Examples


data(Coated)
X<-Coated[,2:3]; Y<-Coated[,4:5]
result <- Mpaired(T1=X,T2=Y)
summary(result)



