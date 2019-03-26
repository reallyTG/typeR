library(extremeStat)


### Name: distLweights
### Title: Compute distribution weights from GOF
### Aliases: distLweights
### Keywords: distribution

### ** Examples

# weights from RMSE vector:
RMSE <- c(gum=0.20, wak=0.17, gam=0.21, gev=0.15)
distLweights(RMSE)
distLweights(RMSE, order=FALSE)

# weights from RMSE in data.frame:
df <- data.frame("99.9%"=2:5, RMSE=sample(3:6))
rownames(df) <- letters[1:4]
df ;  distLweights(df, onlydn=FALSE)

# custom weights:
set.seed(42); x <- data.frame(A=1:5, RMSE=runif(5)) ; x
distLweights(x) # two warnings
distLweights(x, weightc=c("1"=3, "3"=5), onlydn=FALSE)
distLweights(x, weightc=c("1"=3, "3"=5), order=FALSE, onlydn=FALSE)

# real life example:
data(annMax)
cw <- c("gpa"=7, "gev"=3, "wak"=6, "wei"=4, "kap"=3.5, "gum"=3, "ray"=2.1,
        "ln3"=2, "pe3"=2.5, "gno"=4, "gam"=5)
dlf <- distLfit(annMax, weightc=cw, quiet=TRUE, order=FALSE)
plotLweights(dlf)


# GOF judgement by RMSE, not R2 --------
# Both RMSE and R2 are computed with ECDF and TCDF
# R2 may be very good (see below), but fit needs to be close to 1:1 line,
# which is better measured by RMSE

dlf <- distLfit(annMax, ks=TRUE)
op <- par(mfrow=c(1,2), mar=c(3,4,0.5,0.5), mgp=c(1.9,0.7,0))
plot(dlf$gof$RMSE, 17:1, yaxt="n", ylab="", type="o"); axis(2, 17:1, rownames(dlf$gof), las=1)
plot(dlf$gof$R2,   17:1, yaxt="n", ylab="", type="o"); axis(2, 17:1, rownames(dlf$gof), las=1)
par(op)
sel <- c("wak","lap","nor","revgum")
plotLfit(dlf, selection=sel, cdf=TRUE)
dlf$gof[sel,-(2:7)]

x <- sort(annMax, decreasing=TRUE)
ECDF <- ecdf(x)(x)
TCDF <- sapply(sel, function(d) lmomco::plmomco(x,dlf$parameter[[d]]))

plot(TCDF[,"lap"],    ECDF, col="cyan", asp=1, las=1)
points(TCDF[,"nor"],    ECDF, col="green")
#points(TCDF[,"wak"],    ECDF, col="blue")
#points(TCDF[,"revgum"], ECDF, col="red")
abline(a=0, b=1, lwd=3, lty=3)
legend("bottomright", c("lap good RMSE bad R2", "nor bad RMSE good R2"),
       col=c("cyan","green"), lwd=2)
berryFunctions::linReg(TCDF[,"lap"], ECDF, add=TRUE, digits=3, col="cyan", pos1="topleft")
berryFunctions::linReg(TCDF[,"nor"], ECDF, add=TRUE, digits=3, col="green", pos1="left")


# more distinct example (but with fake data)
set.seed(42); x <- runif(30)
y1 <-     x+rnorm(30,sd=0.09)
y2 <- 1.5*x+rnorm(30,sd=0.01)-0.3
plot(x,x, asp=1, las=1, main="High cor (R2) does not necessarily mean good fit!")
berryFunctions::linReg(x, y2, add=TRUE, digits=4, pos1="topleft")
points(x,y2, col="red", pch=3)
points(x,y1, col="blue")
berryFunctions::linReg(x, y1, add=TRUE, digits=4, col="blue", pos1="left")
abline(a=0, b=1, lwd=3, lty=3)




