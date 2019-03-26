library(dice)


### Name: getSumProbs
### Title: Calculate the probabilities of all possible outcome sums of a
###   dice roll
### Aliases: getSumProbs
### Keywords: distribution

### ** Examples


## Don't show: 
stopifnot(all.equal(target=getSumProbs(ndicePerRoll=5, nsidesPerDie=6, nkept=3)$probabilities[11,2], current=0.1356739, check.attributes=FALSE, tolerance=.000001))
stopifnot(all.equal(target=getSumProbs(ndicePerRoll=2, nsidesPerDie=20, nkept=1, dropLowest=FALSE)$probabilities[1,2], current=0.0975, check.attributes=FALSE, tollerance=.000001))
## End(Don't show)

## Rolling four six-sided dice and keeping the three highest die rolls

getSumProbs(ndicePerRoll = 4,
            nsidesPerDie = 6,
            nkept = 3)

## Rolling five four-sided dice and adding 1 to each die roll

getSumProbs(ndicePerRoll = 5,
            nsidesPerDie = 4,
            perDieModifier = 1)

## Rolling one twenty-sided die and adding 12 to the result

getSumProbs(ndicePerRoll = 1,
            nsidesPerDie = 20,
            sumModifier = 12)




