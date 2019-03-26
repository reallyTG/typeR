library(deaR)


### Name: Supply_Chain
### Title: Data: Sanei and Mamizadeh Chatghayeb (2013).
### Aliases: Supply_Chain
### Keywords: datasets

### ** Examples

# Example. FDH input-oriented.
# Replication of results in Sanei and Mamizadeh Chatghayeb (2013)
data("Supply_Chain")
data_fdh1 <- read_data(Supply_Chain,
                       dmus=1,
                       inputs= 2:4,
                       outputs=5:6)
# by default orientation="io"
result <- model_fdh(data_fdh1)
efficiencies(result)




