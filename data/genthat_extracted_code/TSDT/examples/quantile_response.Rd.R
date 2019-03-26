library(TSDT)


### Name: quantile_response
### Title: quantile_response
### Aliases: quantile_response

### ** Examples

## Generate example data containing response and treatment
N <- 100
y = runif( min = 0, max = 20, n = N )
df <- as.data.frame( y )
names( df )  <- "y"
df$trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
                  replace = TRUE )

## Default behavior is to return the median
quantile_response( df )
median( df$y ) # should match previous result from quantile_response

## Get Q1 response
quantile_response( df, scoring_function_parameters = list( percentile = 0.25 ) )
quantile( df$y, 0.25 ) # should match previous result from quantile_response

## Get max response
quantile_response( df, scoring_function_parameters = list( percentile = 1 ) )
max( df$y ) # should match previous result from quantile_response



