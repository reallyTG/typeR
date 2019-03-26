library(grove)


### Name: FAnova
### Title: Bayesian functional ANOVA
### Aliases: FAnova

### ** Examples

## Not run: 
##D data <- GenerateSyntheticAnova(st.dev = 5, n.replicates = 5)
##D W <- DWT(data$noisy.Y)
##D X <- data$X
##D ans <- FAnova(W, X, ~ 1 + factorA + factorB)
##D denoised.data <- InvDWT(ans, x = c(0, 0, 1, 0))
##D PlotFun(denoised.data)
## End(Not run)



