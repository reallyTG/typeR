library(UPMASK)


### Name: performCuts
### Title: Perform cuts in the data
### Aliases: performCuts
### Keywords: utilities

### ** Examples

# Create a simple data set with the values and errors
toyDataDF <- data.frame(x=runif(10, 0, 10), dx=rep(0.2, 10), y=runif(10, 0, 10),
                        dy=rep(0.1, 10))

# Call the function to perform cuts
newToyDataDF <- performCuts(toyDataDF)

# Clean the environment
rm(list=c("toyDataDF", "newToyDataDF"))



