library(cheddar)


### Name: LoadCommunity
### Title: Loading and saving Community objects
### Aliases: LoadCommunity SaveCommunity
### Keywords: utilities

### ** Examples

data(TL84)
temp.path <- tempfile()
SaveCommunity(TL84, temp.path)
TL84.loaded <- LoadCommunity(temp.path)
unlink(temp.path, recursive=TRUE)
identical(TL84, TL84.loaded)    # TRUE



