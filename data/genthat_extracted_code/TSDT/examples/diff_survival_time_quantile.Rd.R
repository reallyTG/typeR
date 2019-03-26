library(TSDT)


### Name: diff_survival_time_quantile
### Title: diff_survival_time_quantile
### Aliases: diff_survival_time_quantile

### ** Examples

requireNamespace( "survival", quiet = TRUE )
N <- 200
df <- data.frame( y = survival::Surv( runif( min = 0, max = 20, n = N ),
                            sample( c(0,1), size = N, prob = c(0.2,0.8), replace = TRUE ) ),
                  trt = sample( c('Control','Experimental'), size = N,
                                prob = c(0.4,0.6), replace = TRUE ) )

## Compute difference in median survival time between Experimental arm and
## Control arm.  It is not actually necessary to provide the value for the
## time_var, trt_var, trt_control, and percentile parameters because these
## values are all equal to their default values. The value are explicitly
## provided here simply for clarity.
ex1 <- diff_survival_time_quantile( data = df,
                                    scoring_function_parameters = list( trt_var = "trt",
                                    trt_control = "Control",
                                    percentile = 0.50 ) )

## Compute difference in Q1 survival time. In this example the default value
## for all scoring function parameters are used except percentile, which here
## takes the value 0.25.
ex2 <- diff_survival_time_quantile( data = df,
                                    scoring_function_parameters = list( percentile = 0.25 ) )



