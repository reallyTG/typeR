library(maxTPR)


### Name: maxTPR
### Title: Maximizing the TPR for a Specified FPR
### Aliases: maxTPR

### ** Examples

set.seed(4)
x1 <- rnorm(400)
x2 <- rnorm(400)
y <- rbinom(400,1,exp(x1+x2)/(1+exp(x1+x2)))
data <- data.frame(y,x1,x2)
maxTPR(data,0.2)



