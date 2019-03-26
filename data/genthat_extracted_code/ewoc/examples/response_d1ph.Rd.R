library(ewoc)


### Name: response_d1ph
### Title: Generating a response function based on the EWOC Proportional
###   Hazards model
### Aliases: response_d1ph

### ** Examples

response_sim <- response_d1ph(rho = 0.05, mtd = 40, theta = 0.33,
                             min_dose = 30, max_dose = 50,
                             tau = 10, distribution = "exponential")
response_sim(40)




