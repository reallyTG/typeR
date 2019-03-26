library(MatchingFrontier)


### Name: plotMeans
### Title: Plot covariate means along the frontier.
### Aliases: plotMeans

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)

plotMeans(my.frontier)



