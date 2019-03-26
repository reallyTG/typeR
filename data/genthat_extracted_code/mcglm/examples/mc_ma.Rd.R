library(mcglm)


### Name: mc_ma
### Title: Moving Average Models Structure
### Aliases: mc_ma

### ** Examples

id <- rep(1:2, each = 4)
time <- rep(1:4, 2)
data <- data.frame("id" = id, "time" = time)
mc_ma(id = "id", time = "time", data = data, order = 1)
mc_ma(id = "id", time = "time", data = data, order = 2)




