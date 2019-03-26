library(startR)


### Name: Subset
### Title: Subset a Data Array
### Aliases: Subset
### Keywords: datagen

### ** Examples

sample_array <- array(1:24, dim = c(dataset = 1, sdate = 2, member = 3, ftime = 4))
subset <- Subset(sample_array, c('dataset', 'sdate', 'member'), 
                 list(1, 1, 1), drop = 'selected')



