library(simIReff)


### Name: effFit
### Title: Fit Effectiveness Distributions
### Aliases: effFit effContFit effDiscFit

### ** Examples

e <- effContFit(web2010ap[,1])
str(e, 1)
sapply(e, plot, plot.data = TRUE)

e <- effDiscFit(web2010p20[,1], seq(0,1,.05))
str(e, 1)
sapply(e, plot, plot.data = TRUE)



