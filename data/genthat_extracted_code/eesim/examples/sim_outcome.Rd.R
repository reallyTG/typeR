library(eesim)


### Name: sim_outcome
### Title: Simulate outcome
### Aliases: sim_outcome

### ** Examples

exp <- sim_exposure(n = 5, central = 100, sd = 10, amp = .6,
                    exposure_type = "continuous")
sim_outcome(exposure = exp, average_outcome = 22, trend = "linear")




