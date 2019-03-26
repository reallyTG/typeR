library(TreeBUGS)


### Name: simpleMPT
### Title: C++ Sampler for Standard (Nonhierarchical) MPT Models
### Aliases: simpleMPT

### ** Examples

## Not run: 
##D # fit nonhierarchical MPT model for aggregated data (see ?arnold2013):
##D EQNfile <- system.file("MPTmodels/2htsm.eqn", package="TreeBUGS")
##D d.encoding <- subset(arnold2013, group == "encoding", select = -(1:4))
##D fit <- simpleMPT(EQNfile, colSums(d.encoding),
##D                 restrictions=list("D1=D2=D3","d1=d2","a=g"))
##D # convergence
##D plot(fit)
##D summary(fit)
## End(Not run)



