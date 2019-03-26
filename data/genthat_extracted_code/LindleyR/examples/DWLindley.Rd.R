library(LindleyR)


### Name: DWLindley
### Title: Discrete Weighted Lindley Distribution
### Aliases: DWLindley ddwlindley pdwlindley qdwlindley rdwlindley

### ** Examples

set.seed(1)
x <- rdwlindley(n = 1000, theta = 1.5, alpha = 1.5)
plot(table(x) / sum(table(x)))
points(unique(x),ddwlindley(unique(x), theta = 1.5, alpha = 1.5))

## fires in Greece data (from Bakouch et al., 2014)
data(fires)
library(fitdistrplus)
fit <- fitdist(fires, 'dwlindley', start = list(theta = 0.30, alpha = 1.0), discrete = TRUE)
gofstat(fit, discrete = TRUE)
plot(fit)




