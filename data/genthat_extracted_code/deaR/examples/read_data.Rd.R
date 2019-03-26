library(deaR)


### Name: read_data
### Title: read_data
### Aliases: read_data

### ** Examples

data("Coll_Blasco_2006")
data_example <- read_data(datadea = Coll_Blasco_2006,
                          ni = 2, 
                          no = 2)
# This is the same as:
data_example <- read_data(Coll_Blasco_2006,
                          dmus = 1,
                          inputs = 2:3, 
                          outputs = 4:5)
# If the first input is a non-controllable input:
data_example <- read_data(Coll_Blasco_2006,
                          dmus = 1,
                          inputs = 2:3,
                          outputs = 4:5, 
                          nc_inputs = 1)
# If the second output is a non-discretionary output:
data_example <- read_data(Coll_Blasco_2006,
                          dmus = 1, 
                          inputs = 2:3, 
                          outputs = 4:5, 
                          nd_outputs = 2)
# If the second input is a non-discretionary input and the second output is an undesirable:
data_example <- read_data(Coll_Blasco_2006,
                          dmus = 1, 
                          inputs = 2:3, 
                          outputs = 4:5, 
                          nd_inputs = 2, 
                          ud_outputs = 2)




