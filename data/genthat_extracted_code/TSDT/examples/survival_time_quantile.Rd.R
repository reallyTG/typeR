library(TSDT)


### Name: survival_time_quantile
### Title: survival_time_quantile
### Aliases: survival_time_quantile

### ** Examples

N <- 200
require( survival )
df <- data.frame( y = survival::Surv( runif( min = 0, max = 20, n = N ),
                            sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE ) ),
                  trt = sample( c('Control','Experimental'), size = N,
                                prob = c(0.4,0.6), replace = TRUE ) )

## Compute median survival time in Experimental treatment arm.
ex1 <- survival_time_quantile( data = df,
                               scoring_function_parameters = list( trt_var = "trt",
                               trt_arm = "Experimental",
                               percentile = 0.50 ) )

## Compute Q1 survival time for all data. It is necessary here to explicitly
## specify trt = NULL because a variable called trt exists in df. The default
## behavior is to use this variable as the treatment variable. To override
## the default behavior trt = NULL is included in scoring_function_parameters.
ex2 <- survival_time_quantile( data = df,
                               scoring_function_parameters = list( trt = NULL,
                                                         percentile = 0.25 ) )



