## ----prelim, echo = FALSE, results="hide"--------------------------------
library( knitr)
opts_chunk$set(cache=TRUE, message = FALSE, comment = "", dev="pdf",
                      dpi=300, fig.show = "hold", fig.align = "center")

## ----setup1, eval=FALSE--------------------------------------------------
#  install.packages( "MBHdesign")

## ----setup2--------------------------------------------------------------
library( MBHdesign)

## ----setSeed-------------------------------------------------------------
set.seed( 747)  #a 747 is a big plane

## ----legacySites---------------------------------------------------------
#number of samples
n <- 10
#number of points to sample from
N <- 100^2
#the sampling grid (offset so that the edge locations have same area)
offsetX <- 1/(2*sqrt( N))
my.seq <- seq( from=offsetX, to=1-offsetX, length=sqrt(N))
X <- expand.grid( my.seq, my.seq)
#the legacy sites (three of them)
legacySites <- matrix( runif( 6), ncol=2, byrow=TRUE)
#names can be useful
colnames( X) <- colnames( legacySites) <- c("X1","X2")

## ----inclProbs, dpi=300, out.width='60%'---------------------------------
#non-uniform inclusion probabilities
inclProbs <- 1-exp(-X[,1])
#scaling to enforce summation to n
inclProbs <- n * inclProbs / sum( inclProbs)
#uniform inclusion probabilities would be inclProbs <- rep( n/N, times=N)
#visualise
image( x=unique( X[,1]), y=unique( X[,2]), 
    z=matrix( inclProbs, nrow=sqrt(nrow(X)), ncol=sqrt(nrow( X))), 
    main="(Undadjusted) Inclusion Probabilities", 
    ylab=colnames( X)[2], xlab=colnames( X)[1])
#The legacy locations
points( legacySites, pch=21, bg=grey(0.75), cex=1.5)

## ----alterInclProbs, dpi=300, out.width='60%'----------------------------
#alter inclusion probabilities 
#   so that new samples should be well-spaced from legacy
altInclProbs <- alterInclProbs( legacy.sites=legacySites, 
		potential.sites=X, inclusion.probs = inclProbs)
#visualise
image( x=unique( X[,1]), y=unique( X[,2]), 
    z=matrix( altInclProbs, nrow=sqrt(nrow(X)), ncol=sqrt(nrow( X))), 
    main="Adjusted Inclusion Probabilities",
    ylab=colnames( X)[2], xlab=colnames( X)[1])
#The legacy locations
points( legacySites, pch=21, bg=grey(0.75), cex=1.5)

## ----GetDesign, dpi=300, out.width='60%'---------------------------------
#generate the design according to the altered inclusion probabilities.
samp <- quasiSamp( n=n, dimension=2, 
	study.area=matrix( c(0,0, 0,1, 1,0, 1,1),ncol=2,  byrow=TRUE), 
	potential.sites=X, inclusion.probs=altInclProbs)
#visualise
image( x=unique( X[,1]), y=unique( X[,2]), 
    z=matrix( altInclProbs, nrow=sqrt(nrow(X)), ncol=sqrt(nrow( X))), 
    main="Adjusted Inclusion Probabilities",
    ylab=colnames( X)[2], xlab=colnames( X)[1])
#The legacy locations
points( legacySites, pch=21, bg=grey(0.75), cex=1.5)
points( samp[,1:2], pch=21)

## ----ShowDesign----------------------------------------------------------
print( samp, row.names=FALSE)

## ----GetData-------------------------------------------------------------
#generate some `observations' for the new sites
Z <- 3*( X[samp$ID,1]+X[samp$ID,2]) + 
			sin( 6*( X[samp$ID,1]+X[samp$ID,2]))
#and some for the legacy sites
Zlegacy <- 3*( legacySites[,1]+legacySites[,2]) + 
			sin( 6*( legacySites[,1]+legacySites[,2]))

## ----HTestimate----------------------------------------------------------
#the proportion of legacy sites in the whole sample
fracLegacy <- nrow( legacySites) / (n+nrow( legacySites))
#inclusion probabilities for legacy sites
#   (these are just made up, from uniform)
LegInclProbs <- rep( nrow( legacySites) / N, nrow( legacySites))
#estimator based on legacy sites only
legacyHT <- (1/N) * sum( Zlegacy / LegInclProbs)
#estimator based on new sites only
newHT <- (1/N) * sum( Z / inclProbs[samp$ID])
mean.estimator <- fracLegacy * legacyHT + (1-fracLegacy) * newHT
#print the mean
print( mean.estimator)

## ----NNestimate----------------------------------------------------------
#load the spsurvey package
library( spsurvey)
#rescale the inclusion probs 
#   (the sample frames are the same in legacy and new sites)
tmpInclProbs <- ( c( inclProbs[samp$ID], LegInclProbs) / n) * 
						(n+nrow(legacySites))
#calculate the standard error
se.estimator <- total.est( z=c(Z, Zlegacy), 
	wgt=1/tmpInclProbs, 
	x=c(X[samp$ID,1], legacySites[,1]), 
	y=c(X[samp$ID,2], legacySites[,2]))$StdError[2]
#print it
print( se.estimator)

## ----ModEstimate---------------------------------------------------------
tmp <- modEsti( y=c( Z, Zlegacy), locations=rbind( X[samp$ID,], legacySites),
	includeLegacyLocation=TRUE, legacyIDs=n + 1:nrow( legacySites),
	predPts=X, control=list(B=1000))
print( tmp)

## ----Tidy----------------------------------------------------------------
#write csv
write.csv( samp, file="sample1.csv", row.names=FALSE)
#tidy
rm( list=ls())

## ----sessionInfo, results = "asis", echo = FALSE-------------------------
toLatex(sessionInfo())

