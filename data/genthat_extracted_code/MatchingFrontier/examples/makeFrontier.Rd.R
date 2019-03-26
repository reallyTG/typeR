library(MatchingFrontier)


### Name: makeFrontier
### Title: Compute the balance - sample size frontier.
### Aliases: makeFrontier

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)



