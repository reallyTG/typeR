library(HMP)


### Name: Multinomial
### Title: Generation of Multinomial Random Samples
### Aliases: Multinomial

### ** Examples

	### Generate the number of reads per sample
	### The first number is the number of reads and the second is the number of subjects
	nrs <- rep(15000, 25)
	
	### Create a probability vector
	probs <- c(0.4, 0.3, 0.2, .05, 0.04, .01)
	
	mData <- Multinomial(nrs, probs)
	mData[1:5, 1:5]



