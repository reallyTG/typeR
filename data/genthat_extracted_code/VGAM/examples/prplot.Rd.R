library(VGAM)


### Name: prplot
### Title: Probability Plots for Categorical Data Analysis
### Aliases: prplot prplot.control
### Keywords: graphs models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo)
M <- npred(fit)  # Or fit@misc$M
## Not run: 
##D  prplot(fit)
##D prplot(fit, lty = 1:M, col = (1:M)+2, rug = TRUE, las = 1,
##D        ylim = c(0, 1), rlwd = 2) 
## End(Not run)



