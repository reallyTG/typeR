library(plotfunctions)


### Name: se
### Title: Calculate standard error of the mean.
### Aliases: se

### ** Examples

# load example data:
data(chickwts)
str(chickwts)

# first calculate means per feeding type:
avg <- with(chickwts, tapply(weight, list(feed), mean))
par(cex=1.25)
b <- barplot(avg, beside=TRUE, names.arg=FALSE, ylim=c(0,450))
text(b, rep(0, length(b)), labels=names(avg), srt=90, adj=-.25)

# calculate mean collapsing over feeding types:
abline(h=mean(avg), lwd=1.5, col="red1")
# add SE reflecting variation between feeding types:
abline(h=mean(avg)+c(-1,1)*se(avg), lty=2, col="red1")
text(getCoords(.5), mean(avg)+se(avg), 
    labels=expression("mean" %+-% "1SE"), pos=3, col="red1")

# Note that SE makes more sense for experiments with 
# different groups or participants.




