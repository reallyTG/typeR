library(chipPCR)


### Name: humanrater
### Title: humanrater, a graphical interface to rate curves
### Aliases: humanrater
### Keywords: rate human interactive

### ** Examples

testdata <- data.frame(1:35,
			AmpSim(Cq = 15, noise = TRUE)[, 2],
			AmpSim(Cq = 25, noise = TRUE)[, 2],
			rnorm(35),
			AmpSim(Cq = 35, noise = TRUE)[, 2],
			rnorm(35),
			AmpSim(Cq = 45, noise = TRUE)[, 2])
#we strongly advise against running code below using 'example(humanrater)'
#due to the highly interactive nature of this function (it would not end
#without user's input), it is recommended to just copy lines below into R
#command line
## Not run: 
##D   #check testdata for significance of amplification in two repeats
##D   human.test1 <- humanrater(testdata, repeats = 2)
##D   #check testdata for significance of amplification in one repeat and declare more
##D   #finger friendly (but less obvious) designations
##D   human.test2 <- humanrater(testdata, repeats = 1, list(q = "yes", w = "no"))
##D   
## End(Not run)



