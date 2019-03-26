library(ed50)


### Name: estimate
### Title: Estimate ED50
### Aliases: estimate

### ** Examples

library(ed50)
estimate(groupS$doseSequence, groupS$responseSequence, method = 'Dixon-Mood')
estimate(groupS$doseSequence, groupS$responseSequence, method = 'Logistic', boot.n = 1000)



