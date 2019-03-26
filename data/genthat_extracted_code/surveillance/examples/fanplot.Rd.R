library(surveillance)


### Name: fanplot
### Title: Fan Plot of Forecast Distributions
### Aliases: fanplot
### Keywords: hplot distribution

### ** Examples

## artificial data example to illustrate the graphical options
if (requireNamespace("fanplot")) {
    means <- c(18, 19, 20, 25, 26, 35, 34, 25, 19)
    y <- rlnorm(length(means), log(means), 0.5)
    quantiles <- sapply(1:99/100, qlnorm, log(means), seq(.5,.8,length.out=length(means)))
    
    ## default style with point predictions, color key and log-scale
    fanplot(quantiles = quantiles, probs = 1:99/100, means = means,
            observed = y, key.args = list(start = 1, space = .3), log = "y")
    
    ## with contour lines instead of a key, and different colors
    pal <- colorRampPalette(c("darkgreen", "gray93"))
    fanplot(quantiles = quantiles, probs = 1:99/100, observed = y,
            fan.args = list(fan.col = pal, ln = c(5,10,25,50,75,90,95)/100),
            observed.args = list(type = "b", pch = 19))
}



