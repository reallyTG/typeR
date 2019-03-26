library(semPlot)


### Name: semPlot-tricks
### Title: Tricks that can be used in semPlot.
### Aliases: +.semPlotModel semPlotModel.list

### ** Examples

# A silly dataset:
A <- rnorm(100)
B <- A + rnorm(100)
C <- B + rnorm(100)
DF <- data.frame(A,B,C)

# Two regressions:
res1 <- lm(B ~ C, data = DF)
res2 <- lm(A ~ B + C, data = DF)

# Plot both in the same path diagram in two ways:
semPaths(res1 + res2, "model", "est", intercepts=FALSE)
semPaths(list(res1,res2), "model", "est", intercepts=FALSE)



