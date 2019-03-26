library(xergm.common)


### Name: knecht
### Title: Longitudinal classroom friendship network and behavior (Andrea
###   Knecht)
### Aliases: knecht advice alcohol delinquency demographics friendship
###   primary
### Keywords: datasets

### ** Examples

## Not run: 
##D # ====================================================================
##D # The following example was taken from the JSS article about btergm 
##D # that is referenced above (Leifeld, Cranmer and Desmarais 2017).
##D # ====================================================================
##D 
##D require("texreg")
##D require("sna")
##D require("xergm")
##D require("RSiena")
##D data("knecht")
##D 
##D # step 1: make sure the network matrices have node labels
##D for (i in 1:length(friendship)) {
##D   rownames(friendship[[i]]) <- 1:nrow(friendship[[i]])
##D   colnames(friendship[[i]]) <- 1:ncol(friendship[[i]])
##D }
##D rownames(primary) <- rownames(friendship[[1]])
##D colnames(primary) <- colnames(friendship[[1]])
##D sex <- demographics$sex
##D names(sex) <- 1:length(sex)
##D 
##D # step 2: imputation of NAs and removal of absent nodes:
##D friendship <- handleMissings(friendship, na = 10, method = "remove")
##D friendship <- handleMissings(friendship, na = NA, method = "fillmode")
##D 
##D # step 3: add nodal covariates to the networks
##D for (i in 1:length(friendship)) {
##D   s <- adjust(sex, friendship[[i]])
##D   friendship[[i]] <- network(friendship[[i]])
##D   friendship[[i]] <- set.vertex.attribute(friendship[[i]], "sex", s)
##D   idegsqrt <- sqrt(degree(friendship[[i]], cmode = "indegree"))
##D   friendship[[i]] <- set.vertex.attribute(friendship[[i]],
##D       "idegsqrt", idegsqrt)
##D   odegsqrt <- sqrt(degree(friendship[[i]], cmode = "outdegree"))
##D   friendship[[i]] <- set.vertex.attribute(friendship[[i]],
##D       "odegsqrt", odegsqrt)
##D }
##D sapply(friendship, network.size)
##D 
##D # step 4: plot the networks
##D pdf("knecht.pdf")
##D par(mfrow = c(2, 2), mar = c(0, 0, 1, 0))
##D for (i in 1:length(friendship)) {
##D   plot(network(friendship[[i]]), main = paste("t =", i),
##D   usearrows = TRUE, edge.col = "grey50")
##D }
##D dev.off()
##D 
##D # step 5: estimate TERGMS without and with temporal dependencies
##D model.2a <- btergm(friendship ~ edges + mutual + ttriple +
##D     transitiveties + ctriple + nodeicov("idegsqrt") +
##D     nodeicov("odegsqrt") + nodeocov("odegsqrt") +
##D     nodeofactor("sex") + nodeifactor("sex") + nodematch("sex") +
##D     edgecov(primary), R = 100)
##D 
##D model.2b <- btergm(friendship ~ edges + mutual + ttriple +
##D     transitiveties + ctriple + nodeicov("idegsqrt") +
##D     nodeicov("odegsqrt") + nodeocov("odegsqrt") +
##D     nodeofactor("sex") + nodeifactor("sex") + nodematch("sex") +
##D     edgecov(primary) + delrecip + memory(type = "stability"),
##D     R = 100)
##D 
##D # step 6: alternatively, estimate via MCMC-MLE:
##D model.2d <- mtergm(friendship ~ edges + mutual + ttriple +
##D     transitiveties + ctriple + nodeicov("idegsqrt") +
##D     nodeicov("odegsqrt") + nodeocov("odegsqrt") +
##D     nodeofactor("sex") + nodeifactor("sex") + nodematch("sex") +
##D     edgecov(primary) + delrecip + memory(type = "stability"),
##D     control = control.ergm(MCMC.samplesize = 5000, MCMC.interval = 2000))
##D 
##D # step 7: GOF assessment with out-of-sample prediction
##D model.2e <- btergm(friendship[1:3] ~ edges + mutual + ttriple +
##D     transitiveties + ctriple + nodeicov("idegsqrt") +
##D     nodeicov("odegsqrt") + nodeocov("odegsqrt") +
##D     nodeofactor("sex") + nodeifactor("sex") + nodematch("sex") +
##D     edgecov(primary) + delrecip + memory(type = "stability"),
##D     R = 100)
##D 
##D gof.2e <- gof(model.2e, nsim = 100, target = friendship[[4]],
##D     formula = friendship[3:4] ~ edges + mutual + ttriple +
##D     transitiveties + ctriple + nodeicov("idegsqrt") +
##D     nodeicov("odegsqrt") + nodeocov("odegsqrt") +
##D     nodeofactor("sex") + nodeifactor("sex") + nodematch("sex") +
##D     edgecov(primary) + delrecip + memory(type = "stability"),
##D     coef = coef(model.2b), statistics = c(esp, dsp, geodesic,
##D     deg, triad.undirected, rocpr))
##D pdf("gof-2e.pdf", width = 8, height = 6)
##D plot(gof.2e)
##D dev.off()
## End(Not run)



