library(deaR)


### Name: read_data_fuzzy
### Title: read_data_fuzzy
### Aliases: read_data_fuzzy

### ** Examples


# Example 1. If inputs and/or outputs are symmetric triangular fuzzy numbers
data("Leon2003")
data_example <- read_data_fuzzy(datadea = Leon2003, 
                                dmus = 1,
                                inputs.mL = 2,
                                inputs.dL = 3,
                                outputs.mL = 4,
                                outputs.dL = 5)
# Example 2. If inputs and/or outputs are non-symmetric triangular fuzzy numbers
data("Kao_Liu_2003")
data_example <- read_data_fuzzy(Kao_Liu_2003, 
                                dmus = 1, 
                                inputs.mL = 2, 
                                outputs.mL = 3:7, 
                                outputs.dL = c(NA, NA, 8, NA, 10),
                                outputs.dR = c(NA, NA, 9, NA, 11))
                                



