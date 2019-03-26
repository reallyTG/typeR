library(TSDT)


### Name: parse_rpart
### Title: parse_rpart
### Aliases: parse_rpart

### ** Examples

requireNamespace( "rpart", quietly = TRUE )
## Generate example data containing response, treatment, and covariates
N <- 50
continuous_response = runif( min = 0, max = 20, n = N )
trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
              replace = TRUE )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )

## Fit an rpart model
fit <- rpart::rpart( continuous_response ~ trt + X1 + X2 + X3 + X4,
                     control = rpart::rpart.control( maxdepth = 3L ) )
fit

## Parse the results into a new data.frame
ex1 <- parse_rpart( fit, include_subgroups = TRUE )
ex1



