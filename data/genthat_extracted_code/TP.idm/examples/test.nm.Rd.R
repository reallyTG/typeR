library(TP.idm)


### Name: test.nm
### Title: Graphical tool to check the Markov assumption
### Aliases: test.nm

### ** Examples

data(colonTP)

test.nm(colonTP, s = 0) 
# nothig is displayed since the Markov condition is not relevant 
# for the case s=0 (occupation probabilities) 

test.nm(colonTP, s = 365, t = 1095)



