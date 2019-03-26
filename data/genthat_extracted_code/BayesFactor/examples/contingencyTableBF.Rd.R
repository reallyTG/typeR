library(BayesFactor)


### Name: contingencyTableBF
### Title: Function for Bayesian analysis of one- and two-sample designs
### Aliases: contingencyTableBF
### Keywords: htest

### ** Examples

## Hraba and Grant (1970) doll race data
data(raceDolls)

## Compute Bayes factor for independent binomial design, with
## columns as the fixed margin
bf = contingencyTableBF(raceDolls, sampleType = "indepMulti", fixedMargin = "cols")
bf

## Posterior distribution of difference in probabilities, under alternative
chains = posterior(bf, iterations = 10000)
sameRaceGivenWhite = chains[,"pi[1,1]"] / chains[,"pi[*,1]"]
sameRaceGivenBlack = chains[,"pi[1,2]"] / chains[,"pi[*,2]"]
hist(sameRaceGivenWhite - sameRaceGivenBlack, xlab = "Probability increase",
  main = "Increase in probability of child picking\nsame race doll (white - black)",
  freq=FALSE, yaxt='n')
box()




