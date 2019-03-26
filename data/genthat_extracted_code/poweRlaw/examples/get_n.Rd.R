library(poweRlaw)


### Name: get_n
### Title: Sample size
### Aliases: get_n

### ** Examples

################################################
# Load data and create example object
################################################
data(moby_sample)
m = displ$new(moby_sample)
################################################
# get_n and length should return the same value
################################################
get_n(m)
length(moby_sample)



