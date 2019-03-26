library(BayesX)


### Name: extractSamples
### Title: Extract MCMC samples from a BayesX results directory
### Aliases: extractSamples
### Keywords: file

### ** Examples

## get the samples
samples <- extractSamples(file.path(system.file("examples/samples", package="BayesX"),
                                     "res"))
str(samples)

## check deviance convergence
plot(samples$Deviance)

## fixed parametric effects
plot(samples$FixedEffects)

## nonparametric effects:

## handy plot function to get means and pointwise credible intervals
nonpPlot <- function(samplesMatrix,
                     ...)
{
    x <- as.numeric(colnames(samplesMatrix))

    yMeans <- colMeans(samplesMatrix)
    yCredible <- t(apply(samplesMatrix,
                         MARGIN=2,
                         FUN=quantile,
                         prob=c(0.025, 0.975),
                         na.rm=TRUE))
    
    matplot(x, cbind(yMeans, yCredible),
            type="l",
            lty=c(1, 2, 2),
            lwd=c(2, 1, 1),
            col=c(1, 2, 2),
            ...)
}

nonpPlot(samples$f_x1$functionSamples,
         xlab=expression(x[1]),
         ylab=expression(hat(f)(x[1])))
nonpPlot(samples$f_x2$functionSamples,
         xlab=expression(x[2]),
         ylab=expression(hat(f)(x[2])))

## spatial effect
tanzania <- read.bnd(file=system.file("examples/tanzania.bnd", package="BayesX"))
drawmap(map=tanzania,
        data=
        with(samples$f_district,
             data.frame(name=colnames(functionSamples),
                        estimate=colMeans(functionSamples))),
        regionvar="name",
        plotvar="estimate")



