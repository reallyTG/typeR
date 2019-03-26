library(CIEE)


### Name: generate_data
### Title: Data generation function
### Aliases: generate_data

### ** Examples

# Generate data under the GLM setting with default values
dat_GLM <- generate_data()
head(dat_GLM)

# Generate data under the AFT setting with default values
dat_AFT <- generate_data(setting = "AFT", a = 0.2, b = 4.75)
head(dat_AFT)




