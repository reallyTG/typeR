library(ClimProjDiags)


### Name: Subset
### Title: Subset a Data Array
### Aliases: Subset

### ** Examples

##Example synthetic data:
data <- 1:(2 * 3 * 372 * 1)
dim(data) <- c(time = 372, lon = 2, lat = 3, model = 1)
data_subset <- Subset(data, c('time', 'model'), 
                     list(1:10, TRUE), drop = 'selected')
dim(data_subset)




