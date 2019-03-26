library(apdesign)


### Name: apdesign_i
### Title: apdesign_i: AP coding for a single subject
### Aliases: apdesign_i

### ** Examples

y <- c(10, 15, 21, 20, 23, 25, 27, 25, 28, 29)
time <- c(c(0.2, 0.5, 0.7), c(0.3, 0.6, 0.75, 0.89), c(0.1, 0.3, 0.8))
cycle <- c(rep(1, 3), rep(2, 4), rep(3, 3))
df <- data.frame(y, time, cycle)
apdesign_i(data = df, time_var = "time", cycle_var = "cycle", 
         center_cycle = 1, center_time = 0, max_degree = c(2,1))




