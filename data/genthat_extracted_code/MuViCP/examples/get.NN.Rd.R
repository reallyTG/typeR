library(MuViCP)


### Name: get.NN
### Title: Function to find the nearest neighbours
### Aliases: get.NN

### ** Examples

require(MASS)
mu <- c(3,4)
Sigma <- rbind(c(1,0.2),c(0.2,1))
Y <- mvrnorm(20, mu = mu, Sigma = Sigma)
test <- 1:4
train <- 5:20
nn1a <- get.NN(Y, k = 3, test = 1:4, train = 5:20, dist.type =
'euclidean', nn.type = 'which')
nn1b <- get.NN(Y, k = 3, test = 1:4, train = 5:20, dist.type =
'euclidean', nn.type = 'dist')
nn1c <- get.NN(Y, k = 3, test = 1:4, train = 5:20, dist.type =
'euclidean', nn.type = 'max')
nn2 <- get.NN(Y, p = 0.3, test = 1:4, train = 5:20, dist.type =
'euclidean', nn.type = 'which')



