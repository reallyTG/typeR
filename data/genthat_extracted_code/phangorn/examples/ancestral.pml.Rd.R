library(phangorn)


### Name: ancestral.pml
### Title: Ancestral character reconstruction.
### Aliases: ancestral.pml ancestral.pars pace plotAnc
### Keywords: ~kwd1 ~kwd2

### ** Examples


example(NJ)
fit <- pml(tree, Laurasiatherian)
anc.ml <- ancestral.pml(fit, type = "ml")
anc.p <- ancestral.pars(tree, Laurasiatherian)
## Not run: 
##D require(seqLogo)
##D seqLogo( t(subset(anc.ml, 48, 1:20)[[1]]), ic.scale=FALSE)
##D seqLogo( t(subset(anc.p, 48, 1:20)[[1]]), ic.scale=FALSE)
## End(Not run)
# plot the first site pattern
plotAnc(tree, anc.ml, 1)
# plot the third character 
plotAnc(tree, anc.ml, attr(anc.ml, "index")[3])




