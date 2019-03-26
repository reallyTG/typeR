library(deaR)


### Name: cross_efficiency_fuzzy
### Title: Cross efficiency fuzzy tables
### Aliases: cross_efficiency_fuzzy

### ** Examples

 data("Guo_Tanaka_2001")
 datadea <- read_data_fuzzy(datadea = Guo_Tanaka_2001, 
                            dmus = 1, 
                            inputs.mL = 2:3, 
                            inputs.dL = 4:5, 
                            outputs.mL = 6:7, 
                            outputs.dL = 8:9)
 result <- cross_efficiency_fuzzy(datadea = datadea, 
                                  h = seq(0, 1, 0.2))
 



