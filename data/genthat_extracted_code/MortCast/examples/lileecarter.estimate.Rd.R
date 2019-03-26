library(MortCast)


### Name: lileecarter.estimate
### Title: Coherent Lee-Carter Estimation
### Aliases: lileecarter.estimate

### ** Examples

data(mxM, mxF, package = "wpp2017")
country <- "Germany"
mxm <- subset(mxM, name == country)[,4:16]
mxf <- subset(mxF, name == country)[,4:16]
rownames(mxm) <- rownames(mxf) <- c(0,1, seq(5, 100, by=5))
lc <- lileecarter.estimate(mxm, mxf)
plot(lc$bx, type="l")
lines(lc$ultimate.bx, lty=2)




