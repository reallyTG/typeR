library(deaR)


### Name: Economy
### Title: Data: Wang and Lan (2011).
### Aliases: Economy
### Keywords: datasets

### ** Examples

# Example . Data in wide format.
# Replication of results in Wang and Lan (2011, p. 2768)
data("Economy")
data_example <- read_malmquist(Economy,
                               nper=5,
                               arrangement="horizontal",
                               ni = 2,
                               no = 1)
result <- malmquist_index(data_example)




