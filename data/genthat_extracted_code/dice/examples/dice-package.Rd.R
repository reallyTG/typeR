library(dice)


### Name: dice-package
### Title: Calculate probabilities of various dice-rolling events
### Aliases: dice-package dice
### Keywords: package

### ** Examples

getEventProb(nrolls = 6,
             ndicePerRoll = 1,
             nsidesPerDie = 4,
             eventList = list(4, 3, c(1,2)),
             orderMatters = FALSE)

getEventProb(nrolls = 3,
             ndicePerRoll = 2,
             nsidesPerDie = 6,
             eventList = list(10, 4, c(2:6, 8:12)),
             orderMatters = TRUE)

getSumProbs(ndicePerRoll = 5,
            nsidesPerDie = 6,
            nkept = 3,
            dropLowest = TRUE)



