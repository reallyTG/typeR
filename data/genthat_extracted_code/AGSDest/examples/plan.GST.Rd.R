library(AGSDest)


### Name: plan.GST
### Title: Plans a group sequential trial (GST)
### Aliases: plan.GST
### Keywords: methods

### ** Examples

##The following plans an O'Brien and Flaming group sequential design (GSD)
##with 4 stages and equally spaced looks.
pT <- plan.GST(K=4, SF=1, phi=0, alpha=0.025, delta=6, pow=0.8, compute.alab=TRUE, compute.als=TRUE)



