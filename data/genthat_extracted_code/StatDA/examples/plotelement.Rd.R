library(StatDA)


### Name: plotelement
### Title: Plot Elements of a Discriminant Analysis
### Aliases: plotelement
### Keywords: dplot tree

### ** Examples

data(iris3)
Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]), Sp = rep(c("s","c","v"), rep(50,3)))
train <- sample(1:150, 75) 
z <- MASS::lda(Sp ~ ., Iris, prior = c(1,1,1)/3, subset = train) 

plotelement(z)



