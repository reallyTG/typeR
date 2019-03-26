library(mcglm)


### Name: mc_rw
### Title: Random Walk Models Structure
### Aliases: mc_rw

### ** Examples

id <- rep(1:2, each = 4)
time <- rep(1:4, 2)
data <- data.frame("id" = id, "time" = time)
mc_rw(id = "id", time = "time", data = data, order = 1, proper = FALSE)
mc_rw(id = "id", time = "time", data = data, order = 1, proper = TRUE)
mc_rw(id = "id", time = "time", data = data, order = 2, proper = TRUE)



