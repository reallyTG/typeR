library(TSDT)


### Name: rpart_nodes
### Title: rpart_nodes
### Aliases: rpart_nodes

### ** Examples

requireNamespace( "rpart", quietly = TRUE )
## Generate example data containing response, treatment, and covariates
N <- 50
continuous_response = runif( min = 0, max = 20, n = N )
binary_response <- sample( c('A','B'), size = N, prob = c(0.5,0.5),
                           replace = TRUE )
trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
               replace = TRUE )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )

## Fit an rpart model with continuous response (i.e. regression)
fit1 <- rpart::rpart( continuous_response ~ trt + X1 + X2 + X3 + X4 )
fit1

## Parse the results into a new data.frame
ex1 <- rpart_nodes( fit1 )
ex1

## Fit an rpart model with binary response (i.e. classification)
fit2 <- rpart::rpart( binary_response ~ trt + X1 + X2 + X3 + X4 )
fit2



