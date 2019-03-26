library(TSDT)


### Name: desirable_response_proportion
### Title: desirable_response_proportion
### Aliases: desirable_response_proportion

### ** Examples

N <- 50

data <- data.frame( y = numeric(N),
                    trt = character(N) )

data$y <- sample( c(0,1), size = N, prob = c(0.5,0.5), replace = TRUE )
data$trt <- sample( c('Control','Experimental'), size = N, prob = c(0.4,0.6), replace = TRUE )

## Compute desirable response proportion for all data with increasing
## desirable response (i.e. larger response value is better)
desirable_response_proportion( data, list( desirable_response = 'increasing' ) )
mean( data$y ) # Function return value should match this value

## Compute desirable response proportion for Experimental treatment arm only
## with decreasing desirable response (i.e. smaller response value is better).
desirable_response_proportion( data, list( trt_arm = 'Experimental',
                                           desirable_response = 'decreasing' ) )



