library(berryFunctions)


### Name: seasonality
### Title: Seasonality analysis
### Aliases: seasonality
### Keywords: aplot

### ** Examples

# browseURL("http://nrfa.ceh.ac.uk/data/station/meanflow/39072")
qfile <- system.file("extdata/discharge39072.csv", package="berryFunctions")
Q <- read.table(qfile, skip=19, header=TRUE, sep=",", fill=TRUE)[,1:2]
rm(qfile)
colnames(Q) <- c("date","discharge")
Q$date <- as.Date(Q$date)
Q$discharge[450:581] <- NA
plot(Q, type="l")
seas <- seasonality(date, discharge, data=Q, shift=100, main="NRFA: Thames\nRoyal Windsor Park")
head(seas)
# notice how n for nonmissing values is lower in the first hydrological year,
# which includes parts of two consecutive calendarical years.

# Be careful with your interpretation. This looks normal up to 2007, but then BAM!:
seasonality(date, discharge, data=Q[Q$date<as.Date("2007-07-15"),], plot=3, shift=100, nmax=1)
seasonality(date, discharge, data=Q[Q$date<as.Date("2007-08-15"),], plot=3, shift=100, nmax=1)

# Shift is important. You don't want to have this event included twice:
seasonality(date, discharge, data=Q[850:950,], plot=3, nmax=1, quiet=TRUE, shift=100)

## Not run: 
##D  # excluded from CRAN checks because it is slow
##D seasonality(date, discharge, data=Q, plot=2) # most floods in winter
##D seasonality(date, discharge, data=Q, plot=5, vlab="Dude, look at annual max Q!")
##D seasonality(date, discharge, data=Q, plot=5, shift=100)
##D s <- seasonality(date, discharge, data=Q, plot=4, shift=100, width=3, returnall=TRUE)
##D str(s, max.lev=1)
##D 
##D seasonality(date, discharge, data=Q, plot=3:4, add=0:1, ylim=lim0(400), shift=117)
##D seasonality(date, discharge, data=Q, plot=4, add=TRUE, lwd=3, shift=117, width=3)
## End(Not run)

## Not run: 
##D dev.new(noRStudioGD=TRUE, record=TRUE)     # large graph on 2nd monitor
##D par(mfrow=c(2,2))
##D seasonality(date, discharge, data=Q, plot=(1:5)[-4], shift=100)
##D seasonality(date, discharge, data=Q, plot=(1:5)[-4], lwd=2)
##D seasonality(date, discharge, data=Q, plot=(1:5)[-4], nmax=1, shift=100)
##D seasonality(date, discharge, data=Q, plot=(1:5)[-4], col=divPal(100, ryb=TRUE))
##D dev.off()
## End(Not run)




