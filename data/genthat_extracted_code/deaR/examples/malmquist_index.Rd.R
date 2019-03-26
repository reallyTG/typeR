library(deaR)


### Name: malmquist_index
### Title: Malmquist index
### Aliases: malmquist_index

### ** Examples

# Example 1. With dataset in wide format.
# Replication of results in Wang and Lan (2011, p. 2768)
data("Economy")
data_example <- read_malmquist(datadea = Economy,
                               nper = 5, 
                               arrangement = "horizontal",
                               ni = 2, 
                               no = 1)
result <- malmquist_index(data_example, orientation = "io")
mi <- result$mi
effch <- result$ec
tech <- result$tc

# Example 2. With dataset in long format.
# Replication of results in Wang and Lan (2011, p. 2768)
data("EconomyLong")
data_example2 <- read_malmquist(EconomyLong,
                                percol = 2, 
                                arrangement = "vertical",
                                inputs = 3:4, 
                                outputs = 5)
result2 <- malmquist_index(data_example2, orientation = "io")
mi2 <- result2$mi
effch2 <- result2$ec
tech2 <- result2$tc




