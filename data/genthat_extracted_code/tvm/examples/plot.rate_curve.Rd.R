library(tvm)


### Name: plot.rate_curve
### Title: Plots a rate curve
### Aliases: plot.rate_curve

### ** Examples

r <- rate_curve(rates = c(0.1, 0.2, 0.3), rate_type = "zero_eff")
plot(r)
## Not run: 
##D plot(r, rate_type = "german")
##D plot(r, rate_type = c("french", "german"))
## End(Not run)



