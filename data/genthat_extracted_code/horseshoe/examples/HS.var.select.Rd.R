library(horseshoe)


### Name: HS.var.select
### Title: Variable selection using the horseshoe prior
### Aliases: HS.var.select

### ** Examples

#Example with 20 signals (last 20 entries), rest is noise
truth <- c(rep(0, 80), rep(8, 20))
data <-  truth + rnorm(100)
horseshoe.results <- HS.normal.means(data, method.tau = "truncatedCauchy",
 method.sigma = "fixed")
#Using credible sets. Ideally, the first 80 entries are equal to 0,
#and the last 20 entries equal to 1.
HS.var.select(horseshoe.results, data, method = "intervals")
#Using thresholding. Ideally, the first 80 entries are equal to 0,
#and the last 20 entries equal to 1.
HS.var.select(horseshoe.results, data, method = "threshold")




