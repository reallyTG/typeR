library(AHMbook)


### Name: simHDS
### Title: Simulate data under hierarchical distance sampling protocol
###   (line or point)
### Aliases: simHDS

### ** Examples

# Simulate a data set with the default arguments and look at the structure of the output:
set.seed(123)
tmp <- simHDS()
str(tmp)
head(tmp$data)

tmp <- simHDS("point", discard0=FALSE)
str(tmp)
head(tmp$data, 10)



