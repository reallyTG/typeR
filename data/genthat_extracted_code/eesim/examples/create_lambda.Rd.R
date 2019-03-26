library(eesim)


### Name: create_lambda
### Title: Create a series of mean outcome values
### Aliases: create_lambda

### ** Examples

base <- create_baseline(n = 10, average_baseline = 22, trend = "linear",
                        slope = .4)
exp <- sim_exposure(n = 5, central = 100, sd = 10, amp = .6,
                    exposure_type = "continuous")
create_lambda(baseline = base, exposure = exp$x, rr = 1.01)




