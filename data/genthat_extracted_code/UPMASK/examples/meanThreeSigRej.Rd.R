library(UPMASK)


### Name: meanThreeSigRej
### Title: Perform cuts in the data
### Aliases: meanThreeSigRej
### Keywords: utilities

### ** Examples

# Create a simple data set with the values and errors
toyData <- c(rnorm(30, mean=0, sd=5), 10000, 1000)

# Call the function to perform cuts
toyDataItStat <- meanThreeSigRej(toyData)

cat(paste("True mean             = 0\n"))
cat(paste("Before rejection mean =",round(mean(toyData),2),"\n"))
cat(paste("After rejetion mean   =",round(toyDataItStat$mean,2),"\n"))

# Clean the environment
rm(list=c("toyData", "toyDataItStat"))



