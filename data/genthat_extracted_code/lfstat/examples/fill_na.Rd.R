library(lfstat)


### Name: fill_na
### Title: Interpolation NA values in a vector
### Aliases: fill_na
### Keywords: utilities misc

### ** Examples

x <- 1:20
x[c(2, 3, 6, 11:15)] <- NA
fill_na(x, max.len = 2)



