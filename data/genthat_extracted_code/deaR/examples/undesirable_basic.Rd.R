library(deaR)


### Name: undesirable_basic
### Title: Undesirable inputs and outputs for basic DEA model.
### Aliases: undesirable_basic

### ** Examples

data("Hua_Bian_2007")
# The third output is an undesirable output.
data_example <- read_data(Hua_Bian_2007,
                          ni = 2, 
                          no = 3, 
                          ud_outputs = 3) 
# rts must be "vrs" for undesirable inputs/outputs:
# Translation parameter is set to (max + 1)
result <- model_basic(data_example,
                      orientation = "oo", 
                      rts = "vrs") 




