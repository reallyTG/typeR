library(bnlearn)


### Name: single-node local discovery
### Title: Discover the structure around a single node
### Aliases: 'single-node local discovery' learn.mb learn.nbr
### Keywords: local learning

### ** Examples

learn.mb(learning.test, node = "D", method = "iamb")
learn.mb(learning.test, node = "D", method = "iamb", blacklist = c("A", "F"))

learn.nbr(gaussian.test, node = "F", method = "si.hiton.pc", whitelist = "D")



