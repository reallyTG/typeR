library(UPMASK)


### Name: takeErrorsIntoAccount
### Title: Take Errors Into Account for UPMASK analysis
### Aliases: takeErrorsIntoAccount
### Keywords: utilities

### ** Examples

# Create a simple data set with the values and errors
toyDataDF <- data.frame(x=runif(10, 0, 10), dx=rep(0.2, 10), y=runif(10, 0, 10),
                        dy=rep(0.1, 10))

# Apply the error models to create another data frame
newToyDataDF <- takeErrorsIntoAccount(toyDataDF, c(1,3), c(2,4))

# Plot the results
plot(toyDataDF$x, toyDataDF$y)
points(newToyDataDF$x, newToyDataDF$y, pch=19, cex=0.8, col="red")

# Clean the environment
rm(list=c("toyDataDF", "newToyDataDF"))



