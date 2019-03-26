library(CDM)


### Name: IRT.irfprobPlot
### Title: Plot Item Response Functions
### Aliases: IRT.irfprobPlot

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Plot item response functions from a unidimensional model
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D 
##D dat <- data.Students
##D resp <- dat[, paste0("sc",1:4) ]
##D resp[ paste(resp[,1])==3,1] <-  2
##D psych::describe(resp)
##D 
##D #--- Model 1: PCM in CDM::gdm
##D theta.k <- seq( -5, 5, len=21 )
##D mod1 <- CDM::gdm( dat=resp, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D            centered.latent=TRUE)
##D summary(mod1)
##D 
##D # plot
##D IRT.irfprobPlot( mod1 )
##D # plot in graphics package (which comes with R base version)
##D IRT.irfprobPlot( mod1, package="graphics")
##D # plot first and third item and do not smooth discretized item response
##D # functions in IRT.irfprob
##D IRT.irfprobPlot( mod1, items=c(1,3), smooth=FALSE )
##D # cumulated IRF
##D IRT.irfprobPlot( mod1, cumul=TRUE )
##D 
##D #############################################################################
##D # EXAMPLE 2: Fitted mutidimensional model with gdm
##D #############################################################################
##D 
##D dat <- CDM::data.fraction2$data
##D Qmatrix <- CDM::data.fraction2$q.matrix3
##D 
##D # Model 1: 3-dimensional Rasch Model (normal distribution)
##D theta.k <- seq( -4, 4, len=11 )   # discretized ability
##D mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D               centered.latent=TRUE, maxiter=10 )
##D summary(mod1)
##D 
##D # unsmoothed curves
##D IRT.irfprobPlot(mod1, smooth=FALSE)
##D # smoothed curves
##D IRT.irfprobPlot(mod1)
## End(Not run)



