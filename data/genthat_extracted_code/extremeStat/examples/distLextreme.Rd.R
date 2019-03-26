library(extremeStat)


### Name: distLextreme
### Title: Extreme value stats
### Aliases: distLextreme
### Keywords: distribution dplot hplot ts

### ** Examples


# Basic examples
# BM vs POT
# Plotting options
# weighted mean based on Goodness of fit (GOF)
# Effect of data proportion used to estimate GOF
# compare extremeStat with other packages

library(lmomco)
library(berryFunctions)

data(annMax) # annual streamflow maxima in river in Austria

# Basic examples ---------------------------------------------------------------
dlf <- distLextreme(annMax)
plotLextreme(dlf, log=TRUE)

# Object structure:
str(dlf, max.lev=2)
printL(dlf)

# discharge levels for default return periods:
dlf$returnlev

# Estimate discharge that could occur every 80 years (at least empirically):
Q80 <- distLextreme(dlf=dlf, RPs=80)$returnlev
round(sort(Q80[1:17,1]),1)
# 99 to 143 m^3/s can make a relevant difference in engineering!
# That's why the rows weighted by GOF are helpful. Weights are given as in
plotLweights(dlf) # See also section weighted mean below
# For confidence intervals see ?distLexBoot

# Return period of a given discharge value, say 120 m^3/s:
round0(sort(1/(1-sapply(dlf$parameter, plmomco, x=120) )  ),1)
# exponential:                 every 29 years
# gev (general extreme value dist):  59,
# Weibull:                     every 73 years only


# BM vs POT --------------------------------------------------------------------
# Return levels by Block Maxima approach vs Peak Over Threshold approach:
# BM distribution theoretically converges to GEV, POT to GPD

data(rain, package="ismev")
days <- seq(as.Date("1914-01-01"), as.Date("1961-12-30"), by="days")
BM <- tapply(rain, format(days,"%Y"), max)  ;  rm(days)
dlfBM <- plotLextreme(distLextreme(BM, emp=FALSE), ylim=lim0(100), log=TRUE, nbest=10)
plotLexBoot(distLexBoot(dlfBM, quiet=TRUE), ylim=lim0(100))
plotLextreme(dlfBM, log=TRUE, ylim=lim0(100))

dlfPOT99 <- distLextreme(rain, npy=365.24, trunc=0.99, emp=FALSE)
dlfPOT99 <- plotLextreme(dlfPOT99, ylim=lim0(100), log=TRUE, nbest=10, main="POT 99")
printL(dlfPOT99)

# using only nonzero values (normally yields better fits, but not here)
rainnz <- rain[rain>0]
dlfPOT99nz <- distLextreme(rainnz, npy=length(rainnz)/48, trunc=0.99, emp=FALSE)
dlfPOT99nz <- plotLextreme(dlfPOT99nz, ylim=lim0(100), log=TRUE, nbest=10,
                           main=paste("POT 99 x>0, npy =", round(dlfPOT99nz$npy,2)))

## Not run: 
##D  ## Excluded from CRAN R CMD check because of computing time
##D 
##D dlfPOT99boot <- distLexBoot(dlfPOT99, prop=0.4)
##D printL(dlfPOT99boot)
##D plotLexBoot(dlfPOT99boot)
##D 
##D 
##D dlfPOT90 <- distLextreme(rain, npy=365.24, trunc=0.90, emp=FALSE)
##D dlfPOT90 <- plotLextreme(dlfPOT90, ylim=lim0(100), log=TRUE, nbest=10, main="POT 90")
##D 
##D dlfPOT50 <- distLextreme(rain, npy=365.24, trunc=0.50, emp=FALSE)
##D dlfPOT50 <- plotLextreme(dlfPOT50, ylim=lim0(100), log=TRUE, nbest=10, main="POT 50")
## End(Not run)

ig99 <- ismev::gpd.fit(rain, dlfPOT99$threshold)
ismev::gpd.diag(ig99); title(main=paste(99, ig99$threshold))
## Not run: 
##D ig90 <- ismev::gpd.fit(rain, dlfPOT90$threshold)
##D ismev::gpd.diag(ig90); title(main=paste(90, ig90$threshold))
##D ig50 <- ismev::gpd.fit(rain, dlfPOT50$threshold)
##D ismev::gpd.diag(ig50); title(main=paste(50, ig50$threshold))
## End(Not run)


# Plotting options -------------------------------------------------------------
plotLextreme(dlf=dlf)
# Line colors / select distributions to be plotted:
plotLextreme(dlf, nbest=17, distcols=heat.colors(17), lty=1:5) # lty is recycled
plotLextreme(dlf, selection=c("gev", "gam", "gum"), distcols=4:6, PPcol=3, lty=3:2)
plotLextreme(dlf, selection=c("gpa","glo","wei","exp"), pch=c(NA,NA,6,8),
                 order=TRUE, cex=c(1,0.6, 1,1), log=TRUE, PPpch=c(16,NA), n_pch=20)
# use n_pch to say how many points are drawn per line (important for linear axis)

plotLextreme(dlf, legarg=list(cex=0.5, x="bottom", box.col="red", col=3))
# col in legarg list is (correctly) ignored
## Not run: 
##D ## Excluded from package R CMD check because it's time consuming
##D 
##D plotLextreme(dlf, PPpch=c(1,NA)) # only Weibull plotting positions
##D # add different dataset to existing plot:
##D distLextreme(Nile/15, add=TRUE, PPpch=NA, distcols=1, selection="wak", legend=FALSE)
##D 
##D # Logarithmic axis
##D plotLextreme(distLextreme(Nile), log=TRUE, nbest=8)
##D 
##D 
##D 
##D # weighted mean based on Goodness of fit (GOF) ---------------------------------
##D # Add discharge weighted average estimate continuously:
##D plotLextreme(dlf, nbest=17, legend=FALSE)
##D abline(h=115.6, v=50)
##D RP <- seq(1, 70, len=100)
##D DischargeEstimate <- distLextreme(dlf=dlf, RPs=RP, plot=FALSE)$returnlev
##D lines(RP, DischargeEstimate["weighted2",], lwd=3, col="orange")
##D 
##D # Or, on log scale:
##D plotLextreme(dlf, nbest=17, legend=FALSE, log=TRUE)
##D abline(h=115.9, v=50)
##D RP <- unique(round(logSpaced(min=1, max=70, n=200, plot=FALSE),2))
##D DischargeEstimate <- distLextreme(dlf=dlf, RPs=RP)$returnlev
##D lines(RP, DischargeEstimate["weighted2",], lwd=5)
##D 
##D 
##D # Minima -----------------------------------------------------------------------
##D 
##D browseURL("http://nrfa.ceh.ac.uk/data/station/meanflow/39072")
##D qfile <- system.file("extdata/discharge39072.csv", package="berryFunctions")
##D Q <- read.table(qfile, skip=19, header=TRUE, sep=",", fill=TRUE)[,1:2]
##D rm(qfile)
##D colnames(Q) <- c("date","discharge")
##D Q$date <- as.Date(Q$date)
##D plot(Q, type="l")
##D Qmax <- tapply(Q$discharge, format(Q$date,"%Y"), max)
##D plotLextreme(distLextreme(Qmax, quiet=TRUE))
##D Qmin <- tapply(Q$discharge, format(Q$date,"%Y"), min)
##D dlf <- distLextreme(-Qmin, quiet=TRUE, RPs=c(2,5,10,20,50,100,200,500))
##D plotLextreme(dlf, ylim=c(0,-31), yaxs="i", yaxt="n", ylab="Q annual minimum", nbest=14)
##D axis(2, -(0:3*10), 0:3*10, las=1)
##D -dlf$returnlev[c(1:14,21), ]
##D # Some distribution functions are an obvious bad choice for this, so I use
##D # weighted 3: Values weighted by GOF of dist only for the best half.
##D # For the Thames in Windsor, we will likely always have > 9 m^3/s streamflow
##D 
##D 
##D # compare extremeStat with other packages: ---------------------------------------
##D library(extRemes)
##D plot(fevd(annMax))
##D par(mfrow=c(1,1))
##D return.level(fevd(annMax, type="GEV")) # "GP", "PP", "Gumbel", "Exponential"
##D distLextreme(dlf=dlf, RPs=c(2,20,100))$returnlev["gev",]
##D # differences are small, but noticeable...
##D # if you have time for a more thorough control, please pass me the results!
##D 
##D 
##D # yet another dataset for testing purposes:
##D Dresden_AnnualMax <- c(403, 468, 497, 539, 542, 634, 662, 765, 834, 847, 851, 873,
##D 885, 983, 996, 1020, 1028, 1090, 1096, 1110, 1173, 1180, 1180,
##D 1220, 1270, 1285, 1329, 1360, 1360, 1387, 1401, 1410, 1410, 1456,
##D 1556, 1580, 1610, 1630, 1680, 1734, 1740, 1748, 1780, 1800, 1820,
##D 1896, 1962, 2000, 2010, 2238, 2270, 2860, 4500)
##D plotLextreme(distLextreme(Dresden_AnnualMax))
## End(Not run) # end dontrun




