library(FSA)


### Name: ageBias
### Title: Compute and view possible differences between paired sets of
###   ages.
### Aliases: ageBias plot.ageBias summary.ageBias
### Keywords: htest manip

### ** Examples

ab1 <- ageBias(scaleC~otolithC,data=WhitefishLC,
               ref.lab="Otolith Age",nref.lab="Scale Age")
summary(ab1)
summary(ab1,what="symmetry")
summary(ab1,what="Bowker")
summary(ab1,what="EvansHoenig")
summary(ab1,what="McNemar")
summary(ab1,what="McNemar",cont.corr="Yates")
summary(ab1,what="bias")
summary(ab1,what="diff.bias")
summary(ab1,what="n")
summary(ab1,what=c("n","symmetry","table"))
# flip table (easy to compare to age bias plot) and show zeroes (not dashes)
summary(ab1,what="table",flip.table=TRUE,zero.print="0")


#############################################################
## Differences Plot (inspired by Muir et al. (2008))
# Default (ranges, open circles for sig diffs, marginal hists)
plot(ab1)
# Show CIs for means (with and without ranges)
plot(ab1,show.CI=TRUE)
plot(ab1,show.CI=TRUE,show.range=FALSE)
# show points (with and without CIs)
plot(ab1,show.CI=TRUE,show.range=FALSE,show.pts=TRUE)
plot(ab1,show.range=FALSE,show.pts=TRUE)
# Use same symbols for all means (with ranges)
plot(ab1,pch.mean.sig=19)
# Use same symbols/colors for all means/CIs (without ranges)
plot(ab1,show.range=FALSE,show.CI=TRUE,pch.mean.sig=19,col.CIsig="black")
# Remove histograms
plot(ab1,xHist=FALSE)
plot(ab1,yHist=FALSE)
plot(ab1,xHist=FALSE,yHist=FALSE)
## Suppress confidence intervals for n < a certain value
##   must set this in the original ageBias() call
ab2 <- ageBias(scaleC~otolithC,data=WhitefishLC,min.n.CI=8,
               ref.lab="Otolith Age",nref.lab="Scale Age")
plot(ab2,show.CI=TRUE,show.range=FALSE)

 
#############################################################
## Differences Plot ( inspired by Bland-Altman plots in McBride (2015))
plot(ab1,xvals="mean")
## Modify axis limits
plot(ab1,xvals="mean",xlim=c(1,17))
## Add and remove histograms
plot(ab1,xvals="mean",xHist=TRUE)
plot(ab1,xvals="mean",xHist=TRUE,yHist=FALSE)
plot(ab1,xvals="mean",yHist=FALSE)

#############################################################
## Adding post hoc analyses to the main plot
# get original graphing parameters to be reset at the end
op <- par(no.readonly=TRUE)

# get raw data
tmp <- ab1$d
head(tmp)

# Add mean difference (w/ approx. 95% CI)
bias <- mean(tmp$diff)+c(-1.96,0,1.96)*se(tmp$diff)
plot(ab1,xvals="mean",xlim=c(1,17),allowAdd=TRUE)
abline(h=bias,lty=2,col="red")
par(op)

# Same as above, but without marginal histogram, and with
#   95% agreement lines as well (1.96SDs)
#   (this is nearly a replicate of a Bland-Altman plot)
bias <- mean(tmp$diff)+c(-1.96,0,1.96)*se(tmp$diff)
agline <- mean(tmp$diff)+c(-1.96,1.96)*sd(tmp$diff)
plot(ab1,xvals="mean",yHist=FALSE,allowAdd=TRUE)
abline(h=bias,lty=2,col="red")
abline(h=agline,lty=3,lwd=2,col="blue")
par(op)

# Add linear regression line of differences on means (w/ approx. 95% CI)
lm1 <- lm(diff~mean,data=tmp)
xval <- seq(0,19,0.1)
pred1 <- predict(lm1,data.frame(mean=xval),interval="confidence")
bias1 <- data.frame(xval,pred1)
head(bias1)
plot(ab1,xvals="mean",xlim=c(1,17),allowAdd=TRUE)
lines(lwr~xval,data=bias1,lty=2,col="red")
lines(upr~xval,data=bias1,lty=2,col="red")
lines(fit~xval,data=bias1,lty=2,col="red")
par(op)

# Add loess of differences on means (w/ approx. 95% CI as a polygon)
lo2 <- loess(diff~mean,data=tmp)
xval <- seq(min(tmp$mean),max(tmp$mean),0.1)
pred2 <- predict(lo2,data.frame(mean=xval),se=TRUE)
bias2 <- data.frame(xval,pred2)
bias2$lwr <- bias2$fit-1.96*bias2$se.fit
bias2$upr <- bias2$fit+1.96*bias2$se.fit
head(bias2)
plot(ab1,xvals="mean",xlim=c(1,17),allowAdd=TRUE)
with(bias2,polygon(c(xval,rev(xval)),c(lwr,rev(upr)),
                   col=col2rgbt("red",1/10),border=NA))
lines(fit~xval,data=bias2,lty=2,col="red")
par(op)
                  
# Same as above, but polygon and line behind the points
plot(ab1,xvals="mean",xlim=c(1,17),col.pts="white",allowAdd=TRUE)
with(bias2,polygon(c(xval,rev(xval)),c(lwr,rev(upr)),
                   col=col2rgbt("red",1/10),border=NA))
lines(fit~xval,data=bias2,lty=2,col="red")
points(diff~mean,data=tmp,pch=19,col=col2rgbt("black",1/8))
par(op)

# Can also be made with the reference ages on the x-axis
lo3 <- loess(diff~otolithC,data=tmp)
xval <- seq(min(tmp$otolithC),max(tmp$otolithC),0.1)
pred3 <- predict(lo3,data.frame(otolithC=xval),se=TRUE)
bias3 <- data.frame(xval,pred3)
bias3$lwr <- bias3$fit-1.96*bias3$se.fit
bias3$upr <- bias3$fit+1.96*bias3$se.fit
plot(ab1,show.range=FALSE,show.pts=TRUE,col.pts="white",allowAdd=TRUE)
with(bias3,polygon(c(xval,rev(xval)),c(lwr,rev(upr)),
                   col=col2rgbt("red",1/10),border=NA))
lines(fit~xval,data=bias3,lty=2,col="red")
points(diff~otolithC,data=tmp,pch=19,col=col2rgbt("black",1/8))
par(op)




