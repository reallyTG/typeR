library(grove)


### Name: PlotStates
### Title: Function to plot the hidden states
### Aliases: PlotStates

### ** Examples

## Not run: 
##D data <- GenerateSyntheticAnova(st.dev = 5, n.replicates = 5)
##D W <- DWT(data$noisy.Y)
##D X <- data$X
##D ans <- FAnova(W, X, ~ 1 + factorA + factorB)
##D PlotStates(ans)
##D PlotStates(ans, block = "factorA")
##D PlotStates(ans, block = "factorB")
## End(Not run)



