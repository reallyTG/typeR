library(rdwd)


### Name: dataDWD
### Title: Download data from the DWD CDC FTP Server
### Aliases: dataDWD
### Keywords: data file

### ** Examples

## Not run: 
##D  ## requires internet connection
##D # find files for a given station name and file path:
##D link <- selectDWD("Kupferzell-Rechbach", res="hourly", var="precipitation", per="recent")
##D # actually download and read files
##D prec <- dataDWD(link, dir="DWDdata") # the default dir
##D fname <- dataDWD(link, read=FALSE) # filename, no second download (unless force=TRUE)
##D 
##D # current and historical files:
##D link <- selectDWD("Potsdam", res="daily", var="kl", per="hr", outvec=TRUE); link
##D potsdam <- dataDWD(link)
##D potsdam <- do.call(rbind, potsdam) # this will partly overlap in time
##D plot(TMK~MESS_DATUM, data=tail(potsdam,1000), type="l")
##D # Straight line marks the jump back in time
##D # check for equality:
##D dup <- which(duplicated(potsdam$MESS_DATUM))
##D dup_df <- which(duplicated(potsdam))
##D err <- dup[ ! dup %in% dup_df]
##D err <- potsdam[potsdam$MESS_DATUM %in% potsdam$MESS_DATUM[err], ]
##D err <- err[order(err$MESS_DATUM),]
##D View(err) # WINDGESCHWINDIGKEIT (wind speed) has been slightly changed
##D # Keep only historical dataset:
##D potsdam <- potsdam[!duplicated(potsdam$MESS_DATUM),]
##D 
##D # several files:
##D link <- c(link, selectDWD("Potsdam", res="daily", var="kl", per="hr", outvec=TRUE))
##D clim <- dataDWD(link)
##D fname <- dataDWD(link, read=FALSE)
##D clim <- readDWD(fname)
##D unzip(zipfile=paste0("DWDdata/",fname[1]), exdir="DWDdata/Testunzip")
##D # There's quite some important meta information there!
##D 
##D plot(prec$MESS_DATUM, prec$R1, main="DWD hourly rain Kupferzell", col="blue",
##D      xaxt="n", las=1, type="l", xlab="Date", ylab="Hourly rainfall  [mm]")
##D monthAxis(1, ym=T)
##D 
##D d <- dataDWD(selectDWD(id="05692", res="daily", var="kl", per="recent"))
##D # writes into the same folder (dir="DWDdata")
##D 
##D folder <- dataDWD(link, browse=T)
##D folder
##D 
##D # With many files, use sleep
##D links <- selectDWD(res="daily", var="solar", meta=FALSE)
##D sol <- dataDWD(links, sleep=20) # random waiting time after download (0 to 20 secs)
##D 
##D # Real life example with data completeness check etc:
##D browseURL("http://github.com/brry/prectemp/blob/master/Code_example.R")
##D 
## End(Not run)




