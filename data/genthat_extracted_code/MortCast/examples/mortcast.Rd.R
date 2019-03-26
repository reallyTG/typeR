library(MortCast)


### Name: mortcast
### Title: Coherent Rotated Lee-Carter Prediction
### Aliases: mortcast

### ** Examples

data(mxM, mxF, e0Fproj, e0Mproj, package = "wpp2017")
country <- "Brazil"
# estimate parameters from historical mortality data
mxm <- subset(mxM, name == country)[,4:16]
mxf <- subset(mxF, name == country)[,4:16]
rownames(mxm) <- rownames(mxf) <- c(0,1, seq(5, 100, by=5))
lc <- lileecarter.estimate(mxm, mxf)
# project into future
e0f <- as.numeric(subset(e0Fproj, name == country)[-(1:2)])
e0m <- as.numeric(subset(e0Mproj, name == country)[-(1:2)])
pred <- mortcast(e0m, e0f, lc)
# plot first projection in black and the remaining ones in grey 
plot(pred$female$mx[,1], type="l", log="y", ylim=range(pred$female$mx),
    ylab="female mx", xlab="Age", main=country)
for(i in 2:ncol(pred$female$mx)) lines(pred$female$mx[,i], col="grey")




