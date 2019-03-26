library(EloChoice)


### Name: summary.elochoice
### Title: summarize elochoice object
### Aliases: summary.elochoice

### ** Examples

xdata <- randompairs(nstim=10, nint=500)
x <- elochoice(xdata$winner, xdata$loser, runs=5)
summary(x)



