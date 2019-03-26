library(simIReff)


### Name: effDisc_dks
### Title: Discrete Effectiveness as Discrete Kernel-smoothed Distribution.
### Aliases: effDisc_dks

### ** Examples

e <- effDisc_dks(web2010p20[,1], seq(0,1,.05))
c(e$mean, e$var)
plot(e, plot.data = TRUE)
e2 <- effDisc_dks(web2010p20[,1], seq(0,1,.05), mult = 2)
c(e2$mean, e2$var)
plot(e2, plot.data = TRUE)



