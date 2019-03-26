library(INLABMA)


### Name: sem.inla
### Title: Fit spatial econometrics models with INLA
### Aliases: sem.inla slm.inla sdm.inla sac.inla
### Keywords: models

### ** Examples


## Not run: 
##D 
##D if(requireNamespace("INLA", quietly = TRUE)) {
##D require(INLA)
##D require(spdep)
##D 
##D data(columbus)
##D 
##D lw <- nb2listw(col.gal.nb, style="W")
##D 
##D #Maximum Likelihood (ML) estimation
##D colsemml <- errorsarlm(CRIME ~ INC + HOVAL, data=columbus, lw, method="eigen", 
##D 	quiet=FALSE)
##D colslmml <- lagsarlm(CRIME ~ INC + HOVAL, data=columbus, lw, method="eigen", 
##D 	type="lag", quiet=FALSE)
##D colsdmml <- lagsarlm(CRIME ~ INC + HOVAL, data=columbus, lw, method="eigen", 
##D 	type="mixed", quiet=FALSE)
##D 
##D #Define grid on rho
##D rrho<-seq(-1, .95, length.out=40)
##D 
##D #Adjacency matrix
##D W <- as(as_dgRMatrix_listw(nb2listw(col.gal.nb)), "CsparseMatrix")
##D #Index for spatial random effects
##D columbus$idx<-1:nrow(columbus)
##D 
##D #Formula
##D form<- CRIME ~ INC + HOVAL
##D 
##D zero.variance = list(prec=list(initial = 25, fixed=TRUE))
##D 
##D 
##D 
##D seminla<-mclapply(rrho, function(rho){
##D 
##D                 sem.inla(form, d=columbus, W=W, rho=rho,
##D                         family = "gaussian", impacts=FALSE,
##D                         control.family = list(hyper = zero.variance),
##D                         control.predictor=list(compute=TRUE),
##D                         control.compute=list(dic=TRUE, cpo=TRUE),
##D                         control.inla=list(print.joint.hyper=TRUE), 
##D 				#tolerance=1e-20, h=1e-6),
##D 			verbose=FALSE
##D                 )
##D 
##D })
##D 
##D 
##D 
##D slminla<-mclapply(rrho, function(rho){
##D 
##D                 slm.inla(form, d=columbus, W=W, rho=rho,
##D                         family = "gaussian", impacts=FALSE,
##D                         control.family = list(hyper = zero.variance),
##D                         control.predictor=list(compute=TRUE),
##D                         control.compute=list(dic=TRUE, cpo=TRUE),
##D                         control.inla=list(print.joint.hyper=TRUE), 
##D 				#tolerance=1e-20, h=1e-6),
##D 			verbose=FALSE
##D                 )
##D })
##D 
##D 
##D sdminla<-mclapply(rrho, function(rho){
##D 
##D                 sdm.inla(form, d=columbus, W=W, rho=rho,
##D                         family = "gaussian", impacts=FALSE,
##D                         control.family = list(hyper = zero.variance),
##D                         control.predictor=list(compute=TRUE),
##D                         control.compute=list(dic=TRUE, cpo=TRUE),
##D                         control.inla=list(print.joint.hyper=TRUE), 
##D 				#tolerance=1e-20, h=1e-6),
##D 			verbose=FALSE
##D                 )
##D })
##D 
##D #BMA using a uniform prior (in the log-scale) and using a Gaussian 
##D #approximation to the marginal
##D sembma<-INLABMA(seminla, rrho, 0, usenormal=TRUE)
##D slmbma<-INLABMA(slminla, rrho, 0, usenormal=TRUE)
##D sdmbma<-INLABMA(sdminla, rrho, 0, usenormal=TRUE)
##D 
##D #Display results
##D plot(sembma$rho$marginal, type="l", ylim=c(0,5))
##D lines(slmbma$rho$marginal, lty=2)
##D lines(sdmbma$rho$marginal, lty=3)
##D #Add ML estimates
##D abline(v=colsemml$lambda, col="red")
##D abline(v=colslmml$rho, col="red", lty=2)
##D abline(v=colsdmml$rho, col="red", lty=3)
##D #Legend
##D legend(-1,5, c("SEM", "SLM", "SDM"), lty=1:3)
##D }
##D 
## End(Not run)




