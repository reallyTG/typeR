library(TSDT)


### Name: get_covariates
### Title: get_covariates
### Aliases: get_covariates

### ** Examples

## Create an example data.frame
df <- data.frame( y <- 1:5 )
names( df ) <- "y"
df$time <- 10:14
df$time2 <- 20:24
df$event <- sample( c(0:1), size = 5, replace = TRUE )
df$trt <- sample( c("Control","Treatment"), size = 5, replace = TRUE )
df$x1 <- runif( n = 5 )
df$x2 <- LETTERS[1:5]

## Select the covariate variables by name
get_covariates( df, scoring_function_parameters = list( covariate_vars = c("x1","x2") ) )

## Select the covariate variables by column index
get_covariates( df, scoring_function_parameters = list( covariate_cols = c(6:7) ) )



