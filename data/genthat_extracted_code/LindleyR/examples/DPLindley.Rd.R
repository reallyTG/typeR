library(LindleyR)


### Name: DPLindley
### Title: Discrete Power Lindley Distribution
### Aliases: DPLindley ddplindley pdplindley qdplindley rdplindley

### ** Examples

set.seed(1)
x <- rdplindley(n = 1000, theta = 1.5, alpha = 0.5)
plot(table(x) / sum(table(x)))
points(unique(x),ddplindley(unique(x), theta = 1.5, alpha = 0.5))

## fires in Greece data (from Bakouch et al., 2014)
data(fires)
library(fitdistrplus)
fit <- fitdist(fires, 'dplindley', start = list(theta = 0.30, alpha = 1.0), discrete = TRUE)
gofstat(fit, discrete = TRUE)
plot(fit)




