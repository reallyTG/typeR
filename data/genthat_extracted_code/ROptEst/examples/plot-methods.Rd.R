library(ROptEst)


### Name: plot-methods
### Title: Methods for Function plot in Package 'ROptEst'
### Aliases: plot plot-methods plot,IC,missing-method
### Keywords: methods distribution

### ** Examples

N <- NormLocationScaleFamily(mean=0, sd=1)
IC <- optIC(model = N, risk = asCov())
## Don't run to reduce check time on CRAN
## No test: 
plot(IC, main = TRUE, panel.first= grid(),
     col = "blue", cex.main = 2, cex.inner = 0.6,
     withMBR=TRUE)
## End(No test)



