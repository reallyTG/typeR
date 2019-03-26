library(TSDT)


### Name: subsample
### Title: subsample
### Aliases: subsample

### ** Examples

## Generate example data frame containing response and treatment
N <- 50
x <- data.frame( runif( N ) )
names( x ) <- "response"
x$treatment <- factor( sample( c("Control","Experimental"), size = N,
                       prob = c(0.8,0.2), replace = TRUE ) )

## Generate two subsamples
ex1 <- subsample( x,
                  training_fraction = 0.9,
                  test_fraction = 0.1,
                  n_samples = 2 )

## Generate two subsamples preserving treatment ratio
ex2 <- subsample( x,
                  trt = x$treatment,
                  trt_control = "Control",
                  training_fraction = 0.7,
                  validation_fraction = 0.2,
                  test_fraction = 0.1,
                  n_samples = 2 )



