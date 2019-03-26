library(MCI)


### Name: var.asdummy
### Title: Creating dummy variables
### Aliases: var.asdummy

### ** Examples

charvec <- c("Peter", "Paul", "Peter", "Mary", "Peter", "Paul")
# Creates a vector with three names (Peter, Paul, Mary)
var.asdummy(charvec)
# Returns a data frame with 3 dummy variables
# (Mary_DUMMY, Paul_DUMMY, Peter_DUMMY)

data(grocery2)
# Loads the data
dummyvars <- var.asdummy(grocery2$store_chain)
# Save the dummy variable set into a new dataset
mynewmcidata <- data.frame(grocery2, dummyvars)
# Add the dummy dataset to the input dataset



