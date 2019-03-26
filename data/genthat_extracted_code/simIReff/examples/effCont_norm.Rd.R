library(simIReff)


### Name: effCont_norm
### Title: Continuous Effectiveness as Truncated Normal Distribution.
### Aliases: effCont_norm

### ** Examples

e <- effCont_norm(web2010ap[,1])
c(e$mean, e$var)
plot(e, plot.data = TRUE)



