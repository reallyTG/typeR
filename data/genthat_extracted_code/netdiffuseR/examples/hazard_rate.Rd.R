library(netdiffuseR)


### Name: hazard_rate
### Title: Network Hazard Rate
### Aliases: hazard_rate plot_hazarrate plot_hazard plot.diffnet_hr
### Keywords: univar

### ** Examples

# Creating a random vector of times of adoption
toa <- sample(2000:2005, 20, TRUE)

# Computing cumulative adoption matrix
cumadopt <- toa_mat(toa)$cumadopt

# Visualizing the hazard rate
hazard_rate(cumadopt)



