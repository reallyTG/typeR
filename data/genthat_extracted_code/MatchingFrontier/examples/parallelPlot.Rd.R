library(MatchingFrontier)


### Name: parallelPlot
### Title: Create a parallel plot for a specified point on the frontier.
### Aliases: parallelPlot

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
mahal.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)
parallelPlot(mahal.frontier,
             N = 300,
             variables = c('age',
             're74',
             're75',
             'black'),
             treated.col = 'grey',
             control.col = 'blue'
             )



