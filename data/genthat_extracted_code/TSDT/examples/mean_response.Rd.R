library(TSDT)


### Name: mean_response
### Title: mean_response
### Aliases: mean_response

### ** Examples

N <- 50

data <- data.frame( continuous_response = numeric(N),
                   trt = character(N) )

data$continuous_response <- runif( min = 0, max = 20, n = N )
data$trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6),
                    replace = TRUE )

## Compute mean response for all data
mean_response( data )
mean( data$continuous_response ) # Function return value should match this value

## Compute mean response for Experimental treatment arm only
mean_response( data,
               scoring_function_parameters = list( trt_arm = 'Experimental' ) )

# Function return value should match this value
mean( data$continuous_response[ data$trt == 'Experimental' ] )



