library(RPPanalyzer)


### Name: curvePredictSigmoid
### Title: Sigmoidal curve prediction.
### Aliases: curvePredictSigmoid

### ** Examples

x <- seq(-5, 5, by=0.1)
y <- curvePredictSigmoid(x, c(alpha=2, beta=1, gamma=1.5))
plot(x, y)



