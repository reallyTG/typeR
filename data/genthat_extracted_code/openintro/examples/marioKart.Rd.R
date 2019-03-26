library(openintro)


### Name: marioKart
### Title: Wii Mario Kart auctions from Ebay
### Aliases: marioKart
### Keywords: datasets

### ** Examples

data(marioKart)

#===> Identify the outliers <===#
boxPlot(marioKart$totalPr, marioKart$cond, horiz=TRUE)
toss <- which(marioKart$totalPr > 80)
lines(rep(marioKart$totalPr[toss[1]], 2), c(2.4, 2))
text(marioKart$totalPr[toss[1]]-55, 2.4, marioKart$title[toss[1]],
	pos=3, cex=0.5)
lines(rep(marioKart$totalPr[toss[2]], 2), c(1.6, 2))
text(marioKart$totalPr[toss[2]], 1.6, marioKart$title[toss[2]],
	pos=1, cex=0.5)
marioKart[toss, ]
# the other two points marked on the boxplot are legitimate auctions

#===> Replot without the outliers <===#
boxPlot(marioKart$totalPr[-toss], marioKart$cond[-toss], horiz=TRUE)

#===> Fit a Multiple Regression Model <===#
mk <- marioKart[-toss,]
summary(lm(totalPr ~ cond + stockPhoto + duration + wheels, mk))
summary(lm(totalPr ~ cond + stockPhoto + wheels, mk))
summary(fit <- lm(totalPr ~ cond + wheels, mk))

#===> Fit Diagnostics <===#
e <- fit$res
f <- fit$fit
par(mfrow=c(2,3), mar=c(4, 4, 2, 1))
qqnorm(e, ylab="Residuals", main="")
plot(e, xlab="Order of collection", ylab="Residuals")
plot(f, e, xlab="Fitted values", ylab="Residuals")
plot(f, (abs(e)), xlab="Fitted values",
     ylab="Absolute value of residuals")
boxPlot(e, mk$cond, xlab="Condition", ylab="Residuals")
plot(mk$wheels, e, xlab="Number of wheels", ylab="Residuals",
     main="Notice curvature")



