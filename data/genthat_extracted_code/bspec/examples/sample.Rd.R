library(bspec)


### Name: sample.bspec
### Title: Posterior sampling
### Aliases: sample.bspec sample.default sample
### Keywords: ts

### ** Examples

# determine spectrum's posterior distribution:
lhspec <- bspec(lh)

# plot 95 percent central intervals and medians:
plot(lhspec)

# draw and plot two samples from posterior distribution:
lines(lhspec$freq, sample(lhspec), type="b", pch=20, col="red")
lines(lhspec$freq, sample(lhspec), type="b", pch=20, col="green")



