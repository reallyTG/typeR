library(fungible)


### Name: faMAP
### Title: Velicer's minimum partial correlation method for determining the
###   number of major components for a principal components analysis or a
###   factor analysis
### Aliases: faMAP
### Keywords: statistics

### ** Examples

	# Harman's data (1967, p 80) 
	# R = matrix(c(
	# 1.000,  .846,  .805,  .859,  .473,  .398,  .301,  .382,
	#  .846, 1.000,  .881,  .826,  .376,  .326,  .277,  .415,
	#  .805,  .881, 1.000,  .801,  .380,  .319,  .237,  .345,
	#  .859,  .826,  .801, 1.000,  .436,  .329,  .327,  .365,
	#  .473,  .376,  .380,  .436, 1.000,  .762,  .730,  .629,
	#  .398,  .326,  .319,  .329,  .762, 1.000,  .583,  .577,
	#  .301,  .277,  .237,  .327,  .730,  .583, 1.000,  .539,
	#  .382,  .415,  .345,  .365,  .629,  .577,  .539, 1.000), 8,8)

	  F <- matrix(c(  .4,  .1,  .0,
	                  .5,  .0,  .1,
	                  .6,  .03, .1,
	                  .4, -.2,  .0,
	                   0,  .6,  .1,
	                  .1,  .7,  .2,
	                  .3,  .7,  .1,
	                   0,  .4,  .1,
	                   0,   0,  .5,
	                  .1, -.2,  .6, 
	                  .1,  .2,  .7,
	                 -.2,  .1,  .7),12,3)
					 
	  R <- F %*% t(F)
	  diag(R) <- 1 
	  
  	faMAP(R, max.fac = 8, Print = TRUE, Plot = TRUE) 



