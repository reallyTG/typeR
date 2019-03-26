library(qicharts2)


### Name: qic
### Title: Statistical process control charts.
### Aliases: qic

### ** Examples

# Lock random number generator to make reproducible results.
set.seed(2)

# Generate vector of 24 random normal numbers
y <- rnorm(24)

# Run chart
qic(y)

# I control chart
qic(y, chart = 'i')

# U control chart from build-in data set of hospital infection rates faceted
#   by hospital and type of infection.
qic(month, n, 
    n        = days,
    data     = hospital_infections,
    facets   = infection ~ hospital,
    chart    = 'u',
    multiply = 10000,
    title     = 'Hospital infection rates',
    ylab     = 'Number of infections per 10.000 risk days',
    xlab     = 'Month')




