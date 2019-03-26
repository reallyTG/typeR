library(xpose)


### Name: set_vars
### Title: Set variable type, label or units
### Aliases: set_vars set_var_types set_var_labels set_var_units

### ** Examples

# Change variable type
xpdb_2 <- set_var_types(xpdb_ex_pk, .problem = 1, idv = 'TAD')

# Change labels
xpdb_2 <- set_var_labels(xpdb_2, .problem = 1, ALAG1 = 'Lag time', CL = 'Clearance', V = 'Volume')

# Change units
xpdb_2 <- set_var_units(xpdb_2, .problem = 1, ALAG1 = 'h', CL = 'L/h', V = 'L')




