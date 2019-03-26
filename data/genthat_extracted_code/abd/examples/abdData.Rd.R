library(abd)


### Name: abdData
### Title: Find data in _Analysis of Biological Data_
### Aliases: abdData
### Keywords: datasets

### ** Examples

# find all data from examples in chapters 3 and 4
abdData(3:4, 'Example')

# order doesn't matter
abdData('Example', 3:4)

# look for data sets with Example in their name.
abdData(pattern='Example')

# look for data sets with Exercise in their name.
abdData('Exercise')



