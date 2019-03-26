library(dice)


### Name: getEventProb
### Title: Calculate the probability of a specified set of dice-rolling
###   events
### Aliases: getEventProb
### Keywords: distribution

### ** Examples


## Don't show: 
stopifnot(all.equal(getEventProb(nrolls=1, ndicePerRoll=1, nsidesPerDie=6, eventList=list(c(4, 5, 6))), 3/6))
stopifnot(all.equal(getEventProb(nrolls=2, ndicePerRoll=1, nsidesPerDie=6, eventList=list(c(6), c(5, 6))), (1/6 * 2/6 + 2/6 * 1/6) - 1/6^2))
stopifnot(all.equal(getEventProb(nrolls=3, ndicePerRoll=1, nsidesPerDie=6, eventList=list(c(6), c(5, 6), c(4, 5, 6)), orderMatters=TRUE), 1/6 * 2/6 * 3/6))
stopifnot(all.equal(getEventProb(nrolls=5, ndicePerRoll=1, nsidesPerDie=6, eventList=list(c(1), c(2,3,4,5,6), c(2,3,4,5,6), c(2,3,4,5,6), c(2,3,4,5,6))), (1/6) * (5/6)^4 * 5))
stopifnot(all.equal(getEventProb(nrolls=4, ndicePerRoll=1, nsidesPerDie=6, eventList=list(c(6), c(5, 6), c(4, 5, 6))), 0.1952160, tolerance=.000001))
## End(Don't show)

## Probability of rolling at least one 6 when rolling four six-sided dice

getEventProb(nrolls = 4,
             ndicePerRoll = 1,
             nsidesPerDie = 6,
             eventList = list(6))

## Probability of rolling a 6, followed by a 5, followed by either a 1, 2,
## or 3 when rolling three six-sided dice

getEventProb(nrolls = 3,
             ndicePerRoll = 1,
             nsidesPerDie = 6,
             eventList = list(6, 5, 1:3),
             orderMatters = TRUE)

## Probability of rolling no 10's when rolling two ten-sided dice

getEventProb(nrolls = 2,
             ndicePerRoll = 1,
             nsidesPerDie = 10,
             eventList = list(1:9,1:9))





