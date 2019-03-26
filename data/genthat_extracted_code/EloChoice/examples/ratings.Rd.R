library(EloChoice)


### Name: ratings
### Title: indiviual stimulus ratings
### Aliases: ratings

### ** Examples

xdata <- randompairs(nstim=10, nint=100)
x <- elochoice(xdata$winner, xdata$loser, runs=10)
# ratings from the initial sequence
ratings(x, "original", drawplot=FALSE)
# range of ratings across all randomizations
ratings(x, "range", drawplot=FALSE)
# and producing plot
ratings(x, NULL, drawplot=TRUE)



