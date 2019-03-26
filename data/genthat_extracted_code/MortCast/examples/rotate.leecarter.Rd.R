library(MortCast)


### Name: rotate.leecarter
### Title: Rotated Lee-Carter
### Aliases: rotate.leecarter ultimate.bx

### ** Examples

data(mxF, mxM, e0Fproj, e0Mproj, package = "wpp2017")
country <- "Japan"
mxm <- subset(mxM, name == country)[,4:16]
mxf <- subset(mxF, name == country)[,4:16]
e0f <- as.numeric(subset(e0Fproj, name == country)[-(1:2)])
e0m <- as.numeric(subset(e0Mproj, name == country)[-(1:2)])
rownames(mxm) <- rownames(mxf) <- c(0,1, seq(5, 100, by=5))
lc <- lileecarter.estimate(mxm, mxf)
rotlc <- rotate.leecarter(lc$bx, lc$ultimate.bx, (e0f + e0m)/2)
plot(lc$bx, type="l")
lines(lc$ultimate.bx, col="red")
for(i in 1:ncol(rotlc)) lines(rotlc[,i], col="grey")
  



