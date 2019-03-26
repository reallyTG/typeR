library(GWG)


### Name: NW_below
### Title: Sensitivity, specificity, positive and negative likelihood
###   ratios for prediction of inadequate GWG for normal weight women
### Aliases: NW_below
### Keywords: datasets

### ** Examples

data("NW_below")

#Plot of positive likelihood ratios for inadequate GWG for normal weight women
plot(NW_below$month, NW_below$lr.pos.est,
     xlim=c(1,10),
     ylim=c(0,20),
     main="LR+ for inadequate GWG",
     ylab="likelihood ratio",
     xlab="month",
     cex.main=2,
     font.main=1,
     cex.lab=1.9,
     cex.axis=1.5)
lines(NW_below$month, NW_below$lr.pos.est, lty=1,lwd=4)
lines(NW_below$month, NW_below$lr.pos.lower, lty=2,lwd=4)
lines(NW_below$month, NW_below$lr.pos.upper, lty=2,lwd=4)
abline(h=2,lwd=1, col="grey") 
abline(h=4,lwd=1, col="grey") 
abline(h=6,lwd=1, col="grey") 
abline(h=8,lwd=1, col="grey") 
abline(h=10,lwd=1, col="grey") 
abline(h=12,lwd=1, col="grey") 
abline(h=14,lwd=1, col="grey") 
abline(h=16,lwd=1, col="grey") 
abline(h=18,lwd=1, col="grey") 
axis(1, c(3,5,7,9), cex.axis=1.5)
legend("topleft", c("lr+ estimate", "lr+ confidence interval"),
       col=c("black", "black"), lty=c(1,2),
       bg="white", cex=1.5, lwd=c(3,3))



