library(simIReff)


### Name: effDisc_bbinom
### Title: Discrete Effectiveness as Beta-Binomial Distribution.
### Aliases: effDisc_bbinom

### ** Examples

e <- effDisc_bbinom(web2010p20[,1], seq(0,1,.05))
c(e$mean, e$var)
plot(e, plot.data = TRUE)



