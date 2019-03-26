library(apdesign)


### Name: apdesign
### Title: apdesign: AP coding 'apdesign' returns a data frame with
###   additive polynomial coding
### Aliases: apdesign

### ** Examples

id <- c(rep(1,10), rep(2, 10))
y <- c(c(10, 15, 21, 20, 23, 25, 27, 25, 28, 29), 
     c(12, 16, 18, 20, 20, 22, 28, 27, 29, 31))
time <- c(c(0.2, 0.5, 0.7), c(0.3, 0.6, 0.75, 0.89), c(0.1, 0.3, 0.8), 
        c(0.3, 0.6, 0.7, 0.85), c(0.2, 0.7, 0.79), c(0.2, 0.5, 0.75))
cycle <- c(rep(1, 3), rep(2, 4), rep(3, 3), rep(1, 4), rep(2, 3), rep(3, 3))
df <- data.frame(id, y, time, cycle)
apdesign(data = df, id = "id", time_var = "time", cycle_var = "cycle", 
         center_cycle = 1, center_time = 0, max_degree = c(2,1))



