library(TSDT)


### Name: diff_quantile_response
### Title: diff_quantile_response
### Aliases: diff_quantile_response

### ** Examples

## Generate example data containing response and treatment
N <- 100
y = runif( min = 0, max = 20, n = N )
df <- as.data.frame( y )
names( df )  <- "y"
df$trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
                  replace = TRUE )

## Default behavior is to return the median
diff_quantile_response( df )

# should match previous result from quantile_response
median( df$y[df$trt!='Control'] ) - median( df$y[df$trt=='Control'] )

## Get Q1 response
diff_quantile_response( df, scoring_function_parameters = list( percentile = 0.25 ) )

# should match previous result from quantile_response
quantile( df$y[df$trt!='Control'], 0.25 ) - quantile( df$y[df$trt=='Control'], 0.25 )

## Get max response
diff_quantile_response( df, scoring_function_parameters = list( percentile = 1 ) )

# should match previous result from quantile_response
max( df$y[df$trt!='Control'] ) -  max( df$y[df$trt=='Control'] )



