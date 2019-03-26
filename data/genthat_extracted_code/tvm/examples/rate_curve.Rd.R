library(tvm)


### Name: rate_curve
### Title: Creates a rate curve instance
### Aliases: rate_curve

### ** Examples

rate_curve(rates = c(0.1, 0.2, 0.3), rate_type = "zero_eff")
rate_curve(fun_r = function(x) rep_len(0.1, length(x)), rate_type = "swap", knots = 1:12)
rate_curve(fun_d = function(x) 1 / (1 + x), knots = 1:12)



