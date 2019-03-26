library(deaR)


### Name: plot.dea
### Title: Plot for DEA models.
### Aliases: plot.dea

### ** Examples

data_example <- read_data(datadea = Fortune500,
                          dmus = 1,
                          inputs = 2:4, 
                          outputs = 5:6)
result <- model_basic(data_example)
plot(result)




