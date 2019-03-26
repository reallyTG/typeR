library(MatchingFrontier)


### Name: plotFrontier
### Title: Plot the balance - sample size frontier.
### Aliases: plotFrontier

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)

plotFrontier(my.frontier)



