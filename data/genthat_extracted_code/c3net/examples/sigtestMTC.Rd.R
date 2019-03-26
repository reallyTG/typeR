library(c3net)


### Name: sigtestMTC
### Title: Elimination of nonsignificant edges by application of a
###   procedure for multiple testing correction
### Aliases: sigtestMTC
### Keywords: misc

### ** Examples

data(expdata)

data(truenet)

alpha <- 0.001

itnum <-2

res <- sigtestMTC( expdata, alpha, itnum, methodsig="BH")

net <- c3(res$Inew)  # regulatory network inferred (non zero elements stand for links of
		# the predicted network)

scores <- checknet(net,truenet)



