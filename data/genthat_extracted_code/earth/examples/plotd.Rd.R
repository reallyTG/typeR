library(earth)


### Name: plotd
### Title: Plot the distribution of predictions for each class
### Aliases: plotd
### Keywords: models

### ** Examples

if (require(earth)) {
    old.par <- par(no.readonly=TRUE);
    par(mfrow=c(2,2), mar=c(4, 3, 1.7, 0.5), mgp=c(1.6, 0.6, 0), par(cex = 0.8))
    data(etitanic)
    mod <- earth(survived ~ ., data=etitanic, degree=2, glm=list(family=binomial))

    plotd(mod)

    plotd(mod, hist=TRUE, legend.pos=c(.25,220))

    plotd(mod, hist=TRUE, type="class", labels=TRUE, xlab="", xaxis.cex=.8)

    par(old.par)
}



