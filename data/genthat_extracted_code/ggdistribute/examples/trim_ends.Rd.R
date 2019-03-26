library(ggdistribute)


### Name: trim_ends
### Title: Trim extreme values at each end of a vector.
### Aliases: trim_ends

### ** Examples

x <- rgamma(10000, 1, 1)
range(x)
length(x)     # <- 10000
sum(is.na(x)) # <- 0

t <- trim_ends(x, trim = 0.1)
range(t)
length(t)     # <- 9000
sum(is.na(t)) # <- 0

t <- trim_ends(x, 0.1, na.rm = FALSE)
range(t, na.rm = TRUE)
length(t)     # <- 10000
sum(is.na(t)) # <- 1000



