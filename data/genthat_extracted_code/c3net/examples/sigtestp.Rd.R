library(c3net)


### Name: sigtestp
### Title: Significance test for elimination of nonsignificant edges
### Aliases: sigtestp
### Keywords: misc

### ** Examples

data(expdata)

data(truenet)

alpha <- 0.001

itnum <- 2

res <- sigtestp( expdata, alpha, itnum)

net <- c3(res$Inew)  # regulatory network inferred (non zero elements stand for links of
		# the predicted network)

scores <- checknet(net,truenet)



