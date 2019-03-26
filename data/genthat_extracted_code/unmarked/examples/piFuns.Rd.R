library(unmarked)


### Name: piFuns
### Title: Compute multinomial cell probabilities
### Aliases: removalPiFun doublePiFun piFuns

### ** Examples


(pRem <- matrix(0.5, nrow=3, ncol=3))	# Capture probabilities
removalPiFun(pRem)			# Cell probs

(pDouble <- matrix(0.5, 3, 2))		# Observer detection probs
doublePiFun(pDouble)			# Cell probs

# A user-defined piFun calculating removal probs when time intervals differ.
# Here 10-minute counts were divided into 2, 3, and 5 minute intervals.
# This function could be supplied to unmarkedFrameMPois along with the obsToY
# argument shown below.

instRemPiFun <- function(p) {
	M <- nrow(p)
	J <- ncol(p)
	pi <- matrix(NA, M, J)
	p[,1] <- pi[,1] <- 1 - (1 - p[,1])^2
	p[,2] <- 1 - (1 - p[,2])^3
	p[,3] <- 1 - (1 - p[,3])^5
	for(i in 2:J) {
		pi[,i] <- pi[, i - 1]/p[, i - 1] * (1 - p[, i - 1]) * p[, i]
		}
	return(pi)
	} 
	
instRemPiFun(pRem)

# Associated obsToY matrix required by unmarkedFrameMPois
o2y <- diag(3) # if y has 3 columns
o2y[upper.tri(o2y)] <- 1
o2y




