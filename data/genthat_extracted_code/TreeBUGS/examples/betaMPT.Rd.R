library(TreeBUGS)


### Name: betaMPT
### Title: Fit a Hierarchical Beta-MPT Model
### Aliases: betaMPT

### ** Examples

## Not run: 
##D # fit beta-MPT model for encoding condition (see ?arnold2013):
##D EQNfile <- system.file("MPTmodels/2htsm.eqn", package="TreeBUGS")
##D d.encoding <- subset(arnold2013, group == "encoding", select = -(1:4))
##D fit <- betaMPT(EQNfile, d.encoding, n.thin=5,
##D                restrictions=list("D1=D2=D3","d1=d2","a=g"))
##D # convergence
##D plot(fit, parameter = "mean", type = "default")
##D summary(fit)
## End(Not run)



