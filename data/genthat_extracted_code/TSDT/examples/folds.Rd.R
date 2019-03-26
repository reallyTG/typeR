library(TSDT)


### Name: folds
### Title: folds
### Aliases: folds

### ** Examples

# Generate random example data
N <- 200
ID <- 1:N
continuous_response = runif( min = 0, max = 20, n = N )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )

df <- data.frame( ID )
names( df ) <- "ID"
df$response <- continuous_response
df$X1 <- X1
df$X2 <- X2
df$X3 <- factor( X3 )
df$X4 <- factor( X4 )

## Partition data into 5 folds
ex1 <- folds( df, k = 5 )

## Partition data into 10 folds
ex2 <- folds( df, k = 10 )



