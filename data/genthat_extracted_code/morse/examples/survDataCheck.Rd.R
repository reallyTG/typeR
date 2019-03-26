library(morse)


### Name: survDataCheck
### Title: Checks if an object can be used to perform survival analysis
### Aliases: survDataCheck

### ** Examples

# Run the check data function
data(zinc)
survDataCheck(zinc)

# Now we insert an error in the dataset, by artificially increasing the
# number of survivors at a given time point, in such a way that the number
# of indivuals increases in the corresponding replicate
zinc[25, "Nsurv"] <- as.integer(20)
survDataCheck(zinc, diagnosis.plot = TRUE)




