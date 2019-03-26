library(ewoc)


### Name: pdlt_d1ph
### Title: Generating a probability of DLT function based on the EWOC
###   Proportional Hazards model
### Aliases: pdlt_d1ph

### ** Examples

pdlt <- pdlt_d1ph(rho = 0.05, mtd = 40, theta = 0.33,
                 min_dose = 30, max_dose = 50,
                 tau = 10, distribution = "exponential")
pdlt(40)




