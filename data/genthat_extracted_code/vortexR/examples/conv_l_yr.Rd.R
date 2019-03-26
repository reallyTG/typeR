library(vortexR)


### Name: conv_l_yr
### Title: Convert 'census' data into long format
### Aliases: conv_l_yr

### ** Examples

# Using Pacioni et al. example data. See ?pac.yr for more details.
data(pac.yr)
lyr.classic <- conv_l_yr(pac.yr[[1]] , yrs=c(60, 120), save2disk=FALSE)



