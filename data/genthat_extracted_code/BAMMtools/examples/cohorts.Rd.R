library(BAMMtools)


### Name: cohorts
### Title: Visualize macroevolutionary cohorts
### Aliases: cohorts

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=500)
x <- getCohortMatrix(ed)
cohorts(x, ed)
cohorts(x, ed, col='temperature')
cohorts(x, ed, ofs=0.05, col='temperature')
cohorts(x, ed, pal="temperature", col='temperature', use.plot.bammdata=TRUE)
# gray scale
cohorts(x, ed, col=gray(seq(0.2,0.9,length.out=128)),
        use.plot.bammdata=FALSE)



