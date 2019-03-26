library(deaR)


### Name: model_deaps
### Title: Preference Structure DEA model.
### Aliases: model_deaps

### ** Examples

 data("Fortune500")
 data_deaps <- read_data(datadea = Fortune500,
                         ni = 3, 
                         no = 2)
 result <- model_deaps(data_deaps, 
                       weight_eff = c(1, 2, 3), 
                       orientation = "io", 
                       rts = "vrs")
 efficiencies(result)
 



