library(LindleyR)


### Name: DLindley
### Title: One-Parameter Discrete Lindley Distribution
### Aliases: DLindley ddlindley fires pdlindley qdlindley rdlindley

### ** Examples

set.seed(1)
x <- rdlindley(n = 1000, theta = 1.5)
plot(table(x) / sum(table(x)))
points(unique(x),ddlindley(unique(x), theta = 1.5))

## fires in Greece data (from Bakouch et al., 2014)
data(fires)
library(fitdistrplus)
fit <- fitdist(fires, 'dlindley', start = list(theta = 0.30), discrete = TRUE)
gofstat(fit, discrete = TRUE)
plot(fit)




