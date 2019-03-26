library(TSDT)


### Name: subgroup
### Title: subgroup
### Aliases: subgroup

### ** Examples

requireNamespace( "rpart", quietly = TRUE )

## Generate example data containing response, treatment, and covariates
N <- 20
continuous_response = runif( min = 0, max = 20, n = N )
trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6), replace = TRUE )
X1 <- runif( N, min = 0, max = 1 )
X2 <- runif( N, min = 0, max = 1 )
X3 <- sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE )
X4 <- sample( c('A','B','C'), size = N, prob = c(0.6,0.3,0.1), replace = TRUE )

covariates <- data.frame( trt )
names( covariates ) <- "trt"
covariates$X1 <- X1
covariates$X2 <- X2
covariates$X3 <- X3
covariates$X4 <- X4

## Fit an rpart model
fit <- rpart::rpart( continuous_response ~ trt + X1 + X2 + X3 + X4 )

## Return parsed splits with subgroups
splits1 <- parse_rpart( fit, include_subgroups = TRUE )
splits1

## Subset covariate data according to split for NodeID 3
ex1 <- subgroup( splits = splits1, node = 3, xdata = covariates )
ex1

## Subset response data according to split for NodeID 3
ex2 <- subgroup( splits = splits1, node = 3, xdata = covariates, ydata = continuous_response )
ex2



