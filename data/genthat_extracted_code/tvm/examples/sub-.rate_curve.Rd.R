library(tvm)


### Name: [.rate_curve
### Title: Returns a particular rate or rates from a curve
### Aliases: [.rate_curve

### ** Examples

r <- rate_curve(rates = c(0.1, 0.2, 0.3), rate_type = "zero_eff")
r["zero_eff"]
r["swap",c(1.5, 2)]



