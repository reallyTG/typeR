library(SemiPar)


### Name: plot.spm
### Title: Semiparametric regression plotting
### Aliases: plot.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
plot(fit)

# Now do several customisations

op <- par(bg="white")
par(bg="honeydew")
plot(fit,ylim=range(strontium.ratio),col="green",
     lwd=5,shade.col="mediumpurple1",rug.col="blue")   
points(age,strontium.ratio,col="orange",pch=16)
par(op)




