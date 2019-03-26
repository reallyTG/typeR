library(TreeBUGS)


### Name: BayesFactorSlope
### Title: Bayes Factor for Slope Parameters in Latent-Trait MPT
### Aliases: BayesFactorSlope

### ** Examples

## Not run: 
##D # latent-trait MPT model for the encoding condition (see ?arnold2013):
##D EQNfile <- system.file("MPTmodels/2htsm.eqn", package="TreeBUGS")
##D d.enc <- subset(arnold2013, group == "encoding")
##D 
##D fit <- traitMPT(EQNfile, data = d.enc[, -(1:4)], n.thin=5,
##D                 restrictions=list("D1=D2=D3","d1=d2","a=g"),
##D                 covData = d.enc[,c("age", "pc")],
##D                 predStructure = list("D1 ; age"))
##D plot(fit, parameter = "slope", type = "default")
##D summary(fit)
##D 
##D BayesFactorSlope(fit, "slope_D1_age", direction = "<")
## End(Not run)



