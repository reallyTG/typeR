library(mixdist)


### Name: conditdat
### Title: Add Conditional Data to Grouped Data
### Aliases: conditdat
### Keywords: misc utilities

### ** Examples

data(pike65) # load the data set `pike65'
pike65 # display the data set `pike65'
conditdat(pike65, k = 5, conditsamples =
          c(c(4, 9, 2, 0, 0, 0), c(5, 8, 6, 0, 0,0),
          c(12, 0, 2, 34, 0, 0), c(13, 0, 0, 21, 0, 0),
          c(15, 0, 0, 5, 5, 0), c(16, 0, 0, 6, 5, 1),
          c(17, 0, 0, 5, 7, 0), c(18, 0, 0, 4, 4, 3),
          c(19, 0, 0, 0, 8, 0), c(20, 0, 0, 0, 2, 1),
          c(21, 0, 0, 0, 1, 5), c(22, 0, 0, 0, 2, 4)))
# add conditional data to the grouped data `pike65'



