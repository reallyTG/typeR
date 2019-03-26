library(blandr)


### Name: blandr.plot.limits
### Title: Bland-Altman plot limits for R
### Aliases: blandr.plot.limits

### ** Examples

# Generates two random measurements
measurement1 <- rnorm(100)
measurement2 <- rnorm(100)

# Passes data to the blandr.statistics function to generate Bland-Altman statistics
statistics.results <- blandr.statistics( measurement1 , measurement2 )

# Calls the function
blandr.plot.limits( statistics.results )




