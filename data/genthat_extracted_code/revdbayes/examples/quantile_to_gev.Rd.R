library(revdbayes)


### Name: quantile_to_gev
### Title: Converts quantiles to GEV parameters
### Aliases: quantile_to_gev

### ** Examples

my_q <- c(15, 20, 22.5)
my_p <- 1-c(0.5, 0.9, 0.5^0.01)
x <- quantile_to_gev(quant = my_q, prob = my_p)
# Check
qgev(p = 1 - my_p, loc = x[1], scale = x[2], shape = x[3])



