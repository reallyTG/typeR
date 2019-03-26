library(RSEIS)


### Name: setupDB
### Title: Set up a seismic data base
### Aliases: setupDB
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D ###  location of data base file
##D datadir1  <-  '/home/lees/Site/Santiaguito/SG09'
##D d1  <-  'segyDB'
##D #### scan in the data base file
##D DB  <-  scan(file=paste(sep="/", datadir1, d1), list(fn="", yr=0, jd=0,
##D hr=0, mi=0, sec=0, dur=0))
##D #### interactively fix the DB list
##D DB  <-  setupDB(DB)
##D 
##D 
## End(Not run)







