library(regspec)


### Name: Travel data
### Title: Visits abroad by UK residents
### Aliases: travel trav.qly trav.mly
### Keywords: datasets

### ** Examples

#
# This example estimates monthly values for UK residents leaving the
# country given historical quarterly values and some more recent
# monthly values. The hindcast function is just a wrapper for code that
# computes an approximate autocovariance function for the process and
# performs some matrix calculations to produce Kriging-type estimators.
#
qt <- 1:nrow(trav.qly)*3
mt <- 84+1:nrow(trav.mly)

#
# Approximately centre data
#

Nhigh <- 14
trav.mly2 <- trav.mly[1:Nhigh,3]-5200
mt <- mt[1:Nhigh]
trav.qly2 <- trav.qly[,3]-3*5200
#
# Construct a likely prior model
#
SARIMA0 <- list(ar=0.6, seasonal=list(period=12,sar=0.6), sigma2=60^2)

#
# Learn about the log-spectrum with regspec
#
adj1 <- regspec(D=trav.mly2, deltat=1, plot.log=TRUE, plot.pgram=TRUE,
	varmult=1, smthpar=0.8, SARIMA=SARIMA0, ylim=c(6,20),
	intname=" (months)")

adj2 <- regspec(D=trav.qly2, deltat=3, filter=c(1,1,1), ebeta=adj1$ebeta,
	vbeta=adj1$vbeta, plot.log=TRUE, ylim=c(6,20), SARIMA=SARIMA0,
	plot.pgram=FALSE, intname=" (months)")

#
# Compute a hindcast
#
predtimes <- 1:84

test <- hindcast(Dhigh=trav.mly2, hightimes=mt, Dlow=trav.qly2,
	lowtimes=qt, predtimes=predtimes, filter=c(1,1,1), ebeta=adj2$ebeta,
	vbeta=adj2$vbeta,SARIMA=SARIMA0)

test$hindcast <- test$hindcast+5200

#
# Plot hindcast
#

plot(qt, trav.qly[,3], xlim=range(0,qt,mt), type="o",
	ylim=range(0,trav.mly,trav.qly), xlab="", xaxt="n", ylab="Trips")

axyrs <- 2004:2012
axlabs <- axyrs

for(i in 1:length(axlabs)) {
	axlabs[i]<-paste(axyrs[i])
	}

axis(1, line=0, at=(1:41-1)*3, labels=FALSE)

text((1:length(axlabs)-1)*12, -1800, srt = 45, adj = 1,
	labels = axlabs, xpd = TRUE)

points(mt, trav.mly2+5200, type="o", cex=0.6)

abline(v=84, lty=2)

points(predtimes, test$hindcast, col=rgb(0.2,0.5,0.7),
	type="o", cex=0.6)

for(i in 1:length(predtimes)){
	lines(rep(predtimes[i], 2),
	test$hindcast[i]+3*c(-1,1)*test$var.hindcast[i,i]^0.5,
	col=rgb(0.2,0.5,0.7))
	}



