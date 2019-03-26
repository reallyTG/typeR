library(ewoc)


### Name: response_d1classic
### Title: Generating a binary response function based on the EWOC classic
###   model
### Aliases: response_d1classic

### ** Examples

response_sim <- response_d1classic(rho = 0.05, mtd = 20, theta = 0.33,
                                  min_dose = 10, max_dose = 50)
response_sim(20)




