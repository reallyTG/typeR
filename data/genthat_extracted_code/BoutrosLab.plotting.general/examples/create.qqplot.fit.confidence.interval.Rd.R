library(BoutrosLab.plotting.general)


### Name: create.qqplot.fit.confidence.interval
### Title: Create the confidence bands for a one-sample qq plot
### Aliases: create.qqplot.fit.confidence.interval
### Keywords: iplot

### ** Examples

tmp.x <- rnorm(100);

tmp.confidence.interval <- create.qqplot.fit.confidence.interval(tmp.x);

qqnorm(tmp.x);
qqline(tmp.x);
lines(tmp.confidence.interval$z, tmp.confidence.interval$upper.pw, lty = 2, col = "brown");
lines(tmp.confidence.interval$z, tmp.confidence.interval$lower.pw, lty = 2, col = "brown");
lines(tmp.confidence.interval$z[tmp.confidence.interval$u], 
    tmp.confidence.interval$upper.sim, lty = 2, col = "blue");
lines(tmp.confidence.interval$z[tmp.confidence.interval$l], 
    tmp.confidence.interval$lower.sim, lty = 2, col = "blue");

legend(1, -1.5, c("simultaneous", "pointwise"), col = c("blue", "brown"), lty = 2, bty = "n");




