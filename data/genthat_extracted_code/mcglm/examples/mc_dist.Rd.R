library(mcglm)


### Name: mc_dist
### Title: Distance Models Structure
### Aliases: mc_dist

### ** Examples

id <- rep(1:2, each = 4)
time <- rep(1:4, 2)
data <- data.frame("id" = id, "time" = time)
mc_dist(id = "id", time = "time", data = data)
mc_dist(id = "id", time = "time", data = data, method = "canberra")



