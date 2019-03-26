library(MVTests)


### Name: BoxM
### Title: Box's M Test
### Aliases: BoxM

### ** Examples


data(iris) 
results <- BoxM(data=iris[,1:4],group=iris[,5])
summary(results)



