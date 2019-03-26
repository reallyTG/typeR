library(BayesFactor)


### Name: raceDolls
### Title: Hraba and Grant (1970) children's doll preference data
### Aliases: raceDolls
### Keywords: datasets

### ** Examples


data(raceDolls)

## chi-square test
## Barely significant with continuity correction
chisq.test(raceDolls)

## Bayes factor test (assuming independent binomial sampling plan)
## Very little evidence for the alternative of lack of independence
bf = contingencyTableBF(raceDolls, sampleType = "indepMulti", fixedMargin = "cols")
bf



