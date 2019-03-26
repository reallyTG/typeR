library(simIReff)


### Name: effCont_nks
### Title: Continuous Effectiveness as Truncated Gaussian Kernel-smoothed
###   Distribution.
### Aliases: effCont_nks

### ** Examples

e <- effCont_nks(web2010ap[,1])
c(e$mean, e$var)
plot(e, plot.data = TRUE)



