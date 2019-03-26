library(MatchingFrontier)


### Name: generateDataset
### Title: Generate a data set that is on the balance - sample size
###   frontier.
### Aliases: generateDataset

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)
n <- 300 # Identify the point from which to select the data
matched.data <- generateDataset(my.frontier, N = n)



