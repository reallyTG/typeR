library(EEM)


### Name: commonizeEEM
### Title: Smooth out the different dimensions of EEM data
### Aliases: commonizeEEM

### ** Examples

data(gluten)
data(applejuice)
data <- c(gluten, applejuice)
summary(data) # different dimensions
data_combined <- commonizeEEM(data)
summary(data_combined) # same dimension, ready for unfold




