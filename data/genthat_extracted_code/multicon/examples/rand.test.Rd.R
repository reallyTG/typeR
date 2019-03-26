library(multicon)


### Name: rand.test
### Title: Randomization Test
### Aliases: rand.test
### Keywords: randomization test

### ** Examples

data(caq)
data(beh.comp)
head(caq)
head(beh.comp)
	#Note: In practice 'sims'=1000 is a better baseline
rand.test(caq,beh.comp,sims=100)



