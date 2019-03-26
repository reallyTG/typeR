library(SemiPar)


### Name: lines.spm
### Title: Add a curves to an existing plot.
### Aliases: lines.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
plot(fossil,type="n")
lines(fit)
points(fossil)

# Now do several customisations

op <- par(bg="white")
par(bg="honeydew")
plot(fossil,type="n")
lines(fit,col="green",lwd=5,shade.col="mediumpurple1")   
points(fossil,col="orange",pch=16)
par(op)




