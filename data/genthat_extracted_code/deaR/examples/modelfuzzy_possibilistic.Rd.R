library(deaR)


### Name: modelfuzzy_possibilistic
### Title: Possibilistic Fuzzy DEA model.
### Aliases: modelfuzzy_possibilistic

### ** Examples

# Replication of results in Leon et. al (2003, p. 416)
data("Leon2003")
data_example <- read_data_fuzzy(Leon2003,
                                dmus = 1, 
                                inputs.mL = 2, 
                                inputs.dL = 3, 
                                outputs.mL = 4, 
                                outputs.dL = 5)
result <- modelfuzzy_possibilistic(data_example, 
                                   h = seq(0, 1, by = 0.1), 
                                   orientation = "io", 
                                   rts = "vrs")
efficiencies(result)
 



