library(msos)


### Name: lda
### Title: Linear Discrimination
### Aliases: lda

### ** Examples

# Iris example
x.iris <- as.matrix(iris[,1:4])
# Gets group vector (1, ... , 1, 2, ... , 2, 3, ..., 3)
y.iris <- rep(1:3,c(50,50,50)) 
ld.iris <- lda(x.iris,y.iris)



