library(diseasemapping)


### Name: getStdRate
### Title: Calculate the standardized rate
### Aliases: getStdRate

### ** Examples

data(kentucky)

kentucky2 = getSMR(kentucky, larynxRates, larynx, 
		regionCode="County")

data(referencepop)
newpop <- getStdRate(kentucky2$SMR, larynxRates, referencepop, scale=100000)

newpop[1:10]



