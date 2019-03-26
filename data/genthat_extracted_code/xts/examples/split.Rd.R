library(xts)


### Name: split.xts
### Title: Divide into Groups by Time
### Aliases: split.xts
### Keywords: utilities

### ** Examples

data(sample_matrix)
x <- as.xts(sample_matrix)


split(x)
split(x, f="weeks")
split(x, f="weeks", k=4)



