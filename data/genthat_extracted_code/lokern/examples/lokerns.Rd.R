library(lokern)


### Name: lokerns
### Title: Kernel Regression Smoothing with Local Plug-in Bandwidth
### Aliases: lokerns lokerns.default lokerns.formula
### Keywords: smooth

### ** Examples

data(cars)
lofit <- lokerns(dist ~ speed, data=cars)
lofit # print() method
## Don't show: 
lof1 <- lokerns(cars$ speed, cars$ dist)
ii <- names(lof1) != "call"
stopifnot(all.equal(lof1[ii], lofit[ii], tol = 1e-15))
## End(Don't show)
if(require("sfsmisc")) {
  TA.plot(lofit)
} else { plot(residuals(lofit) ~ fitted(lofit)); abline(h = 0, lty=2) }
qqnorm(residuals(lofit), ylab = "residuals(lofit)")

## nice simple plot of data + smooth
plot(lofit)

(sb <- summary(lofit$bandwidth))
op <- par(fg = "gray90", tcl = -0.2, mgp = c(3,.5,0))
plot(lofit$band, ylim=c(0,3*sb["Max."]), type="h",#col="gray90",
     ann = FALSE, axes = FALSE)

boxplot(lofit$bandwidth, add = TRUE, at = 304, boxwex = 8,
        col = "gray90",border="gray", pars = list(axes = FALSE))
axis(4, at = c(0,pretty(sb)), col.axis = "gray")
par(op)
par(new=TRUE)
plot(dist ~ speed, data = cars,
     main = "Local Plug-In Bandwidth Vector")
lines(lofit, col=4, lwd=2)
mtext(paste("bandwidth in [",
            paste(format(sb[c(1,6)], dig = 3),collapse=","),
            "];  Median b.w.=",formatC(sb["Median"])))



