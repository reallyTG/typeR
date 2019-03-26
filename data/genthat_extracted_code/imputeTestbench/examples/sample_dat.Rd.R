library(imputeTestbench)


### Name: sample_dat
### Title: Sample time series data
### Aliases: sample_dat

### ** Examples

a <- rnorm(1000)

# default sampling
sample_dat(a)

# use mar sampling
sample_dat(a, smps = 'mar')

# show a plot of one repetition
sample_dat(a, plot = TRUE)

# show a plot of one repetition, mar sampling
sample_dat(a, smps = 'mar', plot = TRUE)

# change plot aesthetics
library(ggplot2)
p <- sample_dat(a, plot = TRUE)
p + scale_colour_manual(values = c('black', 'grey'))
p + theme_minimal()
p + ggtitle('Example of simulating missing data')



