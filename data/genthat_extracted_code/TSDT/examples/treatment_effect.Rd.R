library(TSDT)


### Name: treatment_effect
### Title: treatment_effect
### Aliases: treatment_effect

### ** Examples

N <- 100

df <- data.frame( continuous_response = numeric(N),
                  trt = integer(N) )

df$continuous_response <- runif( min = 0, max = 20, n = N )
df$trt <- sample( c(0,1), size = N, prob = c(0.4,0.6), replace = TRUE )

# Compute the treatment effect
treatment_effect( df, list( y_var = 'continuous_response', trt_control = 0 ) )

# Function return value should match this value
mean( df$continuous_response[df$trt == 1] ) - mean( df$continuous_response[df$trt == 0] )



