library(hiPOD)


### Name: probDetEqual3
### Title: Probability of Detection
### Aliases: probDetEqual3
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(MAF, Xmean, T, N.p, error)
{
	pDetEqual <- 0;
	for(n in 0:(2*N.p))
	{
		pConf <- dbinom(n,2*N.p,MAF);
		pDet.not <- 0;
		theta <- (1-error)*n/(2*N.p) + error*(1-n/(2*N.p))
		
		pDet <- pbinom(T-1, Xmean, theta, lower.tail=FALSE)

		pDetEqual <- pDetEqual + pConf*pDet;
	}	
	pDetEqual
  }



