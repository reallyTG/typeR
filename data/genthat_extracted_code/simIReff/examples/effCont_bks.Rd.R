library(simIReff)


### Name: effCont_bks
### Title: Continuous Effectiveness as Beta Kernel-smoothed Distribution.
### Aliases: effCont_bks

### ** Examples

e <- effCont_bks(web2010ap[,1])
c(e$mean, e$var)
plot(e, plot.data = TRUE)



