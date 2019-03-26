library(morse)


### Name: reproDataCheck
### Title: Checks if an object can be used to perform reproduction toxicity
###   data analysis
### Aliases: reproDataCheck
### Keywords: check

### ** Examples


# Run the check data function
data(copper)
reproDataCheck(copper)

# Now we insert an error in the data set, by setting a non-zero number of
# offspring at some time, although there is no surviving individual in the
# replicate from the previous time point.
copper[148, "Nrepro"] <- as.integer(1)
reproDataCheck(copper)




