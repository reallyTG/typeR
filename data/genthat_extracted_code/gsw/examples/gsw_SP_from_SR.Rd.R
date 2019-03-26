library(gsw)


### Name: gsw_SP_from_SR
### Title: Calculate Practical Salinity from Reference Salinity
### Aliases: gsw_SP_from_SR

### ** Examples

SR <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
SP <- gsw_SP_from_SR(SR)
expect_equal(SP, c(34.386552667080714, 34.564513505458834, 34.696889296869848,
                   34.518231743800094, 34.405762086435850, 34.397799632817147))



