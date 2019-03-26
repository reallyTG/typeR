library(gsw)


### Name: gsw_SR_from_SP
### Title: Calculate Reference Salinity from Practical Salinity
### Aliases: gsw_SR_from_SP

### ** Examples

SP <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
SR <- gsw_SR_from_SP(SP)
expect_equal(SR, c(34.711611927085727, 34.891255045714303, 35.024882197714305,
                   34.844535778285724, 34.731002934857159, 34.722965211428587))



