library(AHMbook)


### Name: simHDStr
### Title: Simulate HDS time-removal or double-observer data
### Aliases: simHDStr

### ** Examples

# Run with the default arguments and look at the structure of the output:
set.seed(123)
tmp <- simHDStr() # default: line, removal
str(tmp)
head(tmp$data)
tmp <- simHDStr("point", method="double")
str(tmp)
head(tmp$data)



