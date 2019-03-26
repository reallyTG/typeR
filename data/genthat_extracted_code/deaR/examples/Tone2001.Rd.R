library(deaR)


### Name: Tone2001
### Title: Data: Tone (2001).
### Aliases: Tone2001
### Keywords: datasets

### ** Examples

# Example. Replication of results in Tone (2001, p. 505)
data("Tone2001")
data_example <- read_data(Tone2001,
                          ni = 2,
                          no = 2)
result <- model_sbmeff(data_example,
                       orientation ="no",
                       rts = "crs")
efficiencies(result)
slacks(result)




