library(deaR)


### Name: Electric_plants
### Title: Data: Färe, Grosskopf and Kokkelenberg (1989).
### Aliases: Electric_plants
### Keywords: datasets

### ** Examples

# Example. Replication of results in Simar and Wilson (1998, p.59)
data("Electric_plants")
data_example <- read_data(Electric_plants,
                          dmus = 1,
                          ni=3,
                          no=1)
result <- model_basic(data_example,
                      orientation="io",
                      rts="vrs")
efficiencies(result)




