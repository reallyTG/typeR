library(reliaR)


### Name: Gumbelsurvival
### Title: Survival related functions for the Gumbel distribution
### Aliases: Gumbelsurvival crf.gumbel hgumbel hra.gumbel sgumbel
### Keywords: survival

### ** Examples

## load data set
data(dataset2)
## Maximum Likelihood(ML) Estimates of mu & sigma for the data(dataset2)
## Estimates of mu & sigma using 'maxLik' package
## mu.est = 212.157, sigma.est = 151.768

## Reliability indicators for data(dataset2):

## Reliability function
sgumbel(dataset2, 212.157, 151.768)

## Hazard function
hgumbel(dataset2, 212.157, 151.768)

## hazard rate average(hra)
hra.gumbel(dataset2, 212.157, 151.768)

## Conditional reliability function (age component=0)
crf.gumbel(dataset2, 0.00, 212.157, 151.768)

## Conditional reliability function (age component=3.0)
crf.gumbel(dataset2, 3.0, 212.157, 151.768)



