library(deaR)


### Name: modelfuzzy_guotanaka
### Title: Fuzzy DEA model
### Aliases: modelfuzzy_guotanaka

### ** Examples

# Example 1.
# Replication results in Guo and Tanaka (2001, p. 159). 
# In deaR is implemented the LP poblem given by the model 16 in Guo and Tanaka (2001, p. 155).
# The fuzzy efficiencies are calculated according to equations in (17) (Guo and Tanaka, 2001,p.155).
data("Guo_Tanaka_2001")
data_example <- read_data_fuzzy(Guo_Tanaka_2001, 
                                dmus = 1, 
                                inputs.mL = 2:3, 
                                inputs.dL = 4:5, 
                                outputs.mL = 6:7,
                                outputs.dL = 8:9)
result <- modelfuzzy_guotanaka(data_example, 
                               h = c(0, 0.5, 0.75, 1), 
                               orientation = "io")
efficiencies(result)
 
# Example 2. 
data("Guo_Tanaka_2001")
data_example <- read_data_fuzzy(Guo_Tanaka_2001, 
                                dmus = 1, 
                                inputs.mL = 2:3, 
                                inputs.dL = 4:5, 
                                outputs.mL = 6:7, 
                                outputs.dL = 8:9)
result2 <- modelfuzzy_guotanaka(data_example, 
                                h = seq(0, 1, by = 0.1), 
                                orientation = "io")
efficiencies(result2)




