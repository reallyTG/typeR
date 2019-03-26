library(deaR)


### Name: Fried1993
### Title: Data: Fried, Knox Lovell and Schmidt (1993).
### Aliases: Fried1993
### Keywords: datasets

### ** Examples

# Example. Replication of results in Ali and (1993, p.143).
data("Fried1993")
data_example <- read_data(Fried1993,
                          ni=2,
                          no=1)
result <- model_basic(data_example,
                      orientation="oo",
                      rts="vrs")
efficiencies(result)
targets(result)




