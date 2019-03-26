library(zipfextR)


### Name: getInitialValues
### Title: Calculates initial values for the parameters of the models.
### Aliases: getInitialValues

### ** Examples

data <- rmoezipf(100, 2.5, 1.3)
data <- as.data.frame(table(data))
data[,1] <- as.numeric(levels(data[,1])[data[,1]])
initials <- getInitialValues(data, model='zipf')



