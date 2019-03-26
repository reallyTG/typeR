library(deaR)


### Name: EconomyLong
### Title: Data: Wang and Lan (2011).
### Aliases: EconomyLong
### Keywords: datasets

### ** Examples

# Example. Data in long format.
# Replication of results in Wang and Lan (2011, p. 2768)
data("EconomyLong")
data_example <- read_malmquist(EconomyLong,
                               percol=2,
                               arrangement="vertical",
                               ni = 2,
                               no = 1)
result <- malmquist_index(data_example)




