library(xergm.common)


### Name: chemnet
### Title: German Toxic Chemicals Policy Network in the 1980s (Volker
###   Schneider)
### Aliases: chemnet schneider chemnetde ChemNetDe ChemNetDE pol scifrom
###   scito sci committee infrep intpos types
### Keywords: datasets

### ** Examples

## Not run: 
##D # Replication code for Leifeld and Schneider (2012), AJPS.
##D # Note that the estimates can only be reproduced approximately 
##D # due to internal changes in the statnet package.
##D 
##D # preparatory steps
##D library("statnet")
##D library("xergm")
##D library("texreg")
##D seed <- 12345
##D set.seed(seed)
##D data("chemnet")
##D 
##D # create confirmed network relation
##D sci <- scito * t(scifrom)  # equation 1 in the AJPS paper
##D prefsim <- dist(intpos, method = "euclidean")  # equation 2
##D prefsim <- max(prefsim) - prefsim  # equation 3
##D prefsim <- as.matrix(prefsim)
##D committee <- committee %*% t(committee)  # equation 4
##D diag(committee) <- 0 # the diagonal has no meaning
##D types <- types[, 1]  # convert to vector
##D 
##D # create network objects and store attributes
##D nw.pol <- network(pol) # political/stratgic information exchange
##D set.vertex.attribute(nw.pol, "orgtype", types)
##D set.vertex.attribute(nw.pol, "betweenness", 
##D     betweenness(nw.pol)) # centrality
##D 
##D nw.sci <- network(sci) # technical/scientific information exchange
##D set.vertex.attribute(nw.sci, "orgtype", types)
##D set.vertex.attribute(nw.sci, "betweenness", 
##D     betweenness(nw.sci)) # centrality
##D 
##D # ERGM: model 1 in the AJPS paper; only preference similarity
##D model1 <- ergm(nw.pol ~ edges + edgecov(prefsim), 
##D     control = control.ergm(seed = seed))
##D summary(model1)
##D 
##D # ERGM: model 2 in the AJPS paper; complete model
##D model2 <- ergm(nw.pol ~ 
##D     edges + 
##D     edgecov(prefsim) + 
##D     mutual + 
##D     nodemix("orgtype", base = -7) + 
##D     nodeifactor("orgtype", base = -1) + 
##D     nodeofactor("orgtype", base = -5) + 
##D     edgecov(committee) + 
##D     edgecov(nw.sci) + 
##D     edgecov(infrep) + 
##D     gwesp(0.1, fixed = TRUE) + 
##D     gwdsp(0.1, fixed = TRUE), 
##D     control = control.ergm(seed = seed)
##D )
##D summary(model2)
##D 
##D # ERGM: model 3 in the AJPS paper; only preference similarity
##D model3 <- ergm(nw.sci ~ edges + edgecov(prefsim), 
##D     control = control.ergm(seed = seed))
##D summary(model3)
##D 
##D # ERGM: model 4 in the AJPS paper; complete model
##D model4 <- ergm(nw.sci ~ 
##D     edges + 
##D     edgecov(prefsim) + 
##D     mutual + 
##D     nodemix("orgtype", base = -7) + 
##D     nodeifactor("orgtype", base = -1) + 
##D     nodeofactor("orgtype", base = -5) + 
##D     edgecov(committee) + 
##D     edgecov(nw.pol) + 
##D     edgecov(infrep) + 
##D     gwesp(0.1, fixed = TRUE) + 
##D     gwdsp(0.1, fixed = TRUE), 
##D     control = control.ergm(seed = seed)
##D )
##D summary(model4)
##D 
##D # regression table using the texreg package
##D screenreg(list(model1, model2, model3, model4))
##D 
##D # goodness of fit using the btergm package
##D gof2 <- gof(model2, roc = FALSE, pr = FALSE)
##D gof2  # print gof output
##D plot(gof2)  # visual inspection of GOF
##D 
##D gof4 <- gof(model4, roc = FALSE, pr = FALSE)
##D gof4
##D plot(gof4)
##D 
##D # MCMC diagnostics
##D pdf("diagnostics2.pdf")
##D mcmc.diagnostics(model2)
##D dev.off()
##D 
##D pdf("diagnostics4.pdf")
##D mcmc.diagnostics(model4)
##D dev.off()
## End(Not run)



