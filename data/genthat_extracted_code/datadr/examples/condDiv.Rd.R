library(datadr)


### Name: condDiv
### Title: Conditioning Variable Division
### Aliases: condDiv

### ** Examples

d <- divide(iris, by = "Species")
# equivalent:
d <- divide(iris, by = condDiv("Species"))



