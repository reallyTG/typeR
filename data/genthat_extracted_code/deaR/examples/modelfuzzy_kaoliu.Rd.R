library(deaR)


### Name: modelfuzzy_kaoliu
### Title: Fuzzy DEA model.
### Aliases: modelfuzzy_kaoliu

### ** Examples

# Example 1. 
# Replication of results in Boscá, Liern, Sala and Martínez (2011, p.125)
data("Leon2003")
data_example <- read_data_fuzzy(datadea = Leon2003,
                                dmus = 1, 
                                inputs.mL = 2, 
                                inputs.dL = 3, 
                                outputs.mL = 4, 
                                outputs.dL = 5)
result <- modelfuzzy_kaoliu(data_example,
                            kaoliu_modelname = "basic", 
                            alpha = seq(0, 1, by = 0.1), 
                            orientation = "io", 
                            rts = "vrs")
efficiencies(result)

# Example 2.
# Replication of results in Kao and Liu (2003, p.152)
data("Kao_Liu_2003")
data_example <- read_data_fuzzy(Kao_Liu_2003, 
                                dmus = 1, 
                                inputs.mL = 2, 
                                outputs.mL = 3:7, 
                                outputs.dL = c(NA, NA, 8, NA, 10),
                                outputs.dR = c(NA, NA, 9, NA, 11))
result <- modelfuzzy_kaoliu(data_example, 
                            kaoliu_modelname = "basic", 
                            orientation = "oo", 
                            rts = "vrs", 
                            alpha = 0)
sol <- efficiencies(result)
eff <- data.frame(1 / sol$Worst, 1 / sol$Best)
names(eff) <- c("eff_lower", "eff_upper")
eff




