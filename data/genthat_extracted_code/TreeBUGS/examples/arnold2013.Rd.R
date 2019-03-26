library(TreeBUGS)


### Name: arnold2013
### Title: Data of a Source-Monitoring Experiment
### Aliases: arnold2013
### Keywords: datasets

### ** Examples

head(arnold2013)

## Not run: 
##D # fit hierarchical MPT model for encoding condition:
##D EQNfile <- system.file("MPTmodels/2htsm.eqn", package="TreeBUGS")
##D d.encoding <- subset(arnold2013, group == "encoding", select = -(1:4))
##D fit <- betaMPTcpp(EQNfile, d.encoding, n.thin=5,
##D                   restrictions=list("D1=D2=D3","d1=d2","a=g"))
##D # convergence
##D plot(fit, parameter = "mean", type = "default")
##D summary(fit)
## End(Not run)



