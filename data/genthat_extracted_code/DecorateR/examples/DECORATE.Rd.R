library(DecorateR)


### Name: DECORATE
### Title: Binary classification with DECORATE (Melville and Mooney, 2005)
### Aliases: DECORATE

### ** Examples


data(iris)
y <- as.factor(ifelse(iris$Species[1:100]=="setosa",0,1))
x <- iris[1:100,-5]
dec <- DECORATE(x = x, y = y)




