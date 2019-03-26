library(IRISSeismic)


### Name: butterworth
### Title: Apply Butterworth filter
### Aliases: butterworth
###   butterworth,Trace,numeric,missing,numeric,missing-method
###   butterworth,Trace,numeric,numeric,missing,missing-method
###   butterworth,Trace,numeric,numeric,numeric,character-method
###   butterworth,Trace,numeric,numeric,numeric,missing-method
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # Compare to the results in figure 2a of
##D #
##D # "Determination of New Zealand Ocean Bottom Seismometer Orientation
##D #  via Rayleigh-Wave Polarization", Stachnik et al. 
##D #
##D # http://srl.geoscienceworld.org/content/83/4/704
##D #
##D # (note: since publication, ZU.NZ19..BH1 has been renamed BH2 and ZU.NZ19..BH2 has been renamed BH1)
##D 
##D starttime <- as.POSIXct("2009-02-18 22:01:07",tz="GMT")
##D endtime <- starttime + 630
##D verticalLines <- starttime + seq(30,630,100)
##D 
##D # Get data
##D stZ <- getSNCL(iris,"ZU.NZ19..BHZ",starttime,endtime)
##D st2 <- getSNCL(iris,"ZU.NZ19..BH2",starttime,endtime)
##D st1 <- getSNCL(iris,"ZU.NZ19..BH1",starttime,endtime)
##D 
##D # Demean, Detrend, Taper
##D trZ <- DDT(stZ@traces[[1]],TRUE,TRUE,0.05)
##D tr2 <- DDT(st2@traces[[1]],TRUE,TRUE,0.05)
##D tr1 <- DDT(st1@traces[[1]],TRUE,TRUE,0.05)
##D 
##D # Bandpass filter
##D trZ_f <- butterworth(trZ,2,0.02,0.04,type='pass')
##D tr2_f <- butterworth(tr2,2,0.02,0.04,type='pass')
##D tr1_f <- butterworth(tr1,2,0.02,0.04,type='pass')
##D 
##D # 3 rows
##D layout(matrix(seq(3)))
##D 
##D # Plot
##D plot(trZ_f)
##D abline(v=verticalLines,col='gray50',lty=2)
##D plot(tr2_f)
##D abline(v=verticalLines,col='gray50',lty=2)
##D plot(tr1_f)
##D abline(v=verticalLines,col='gray50',lty=2)
##D 
##D # Restore default layout
##D layout(1)
## End(Not run)



