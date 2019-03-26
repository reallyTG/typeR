library(climatol)


### Name: db2dat
### Title: Get daily or monthly data from a database and build input files
###   *.dat and *.est
### Aliases: db2dat
### Keywords: datagen

### ** Examples

## Not run: 
##D # First we must access our climatic database through RODBC, wich requires to
##D # have this package installed. System programs that allow ODBC connections to
##D # databases must also be installed and properly configured.
##D #
##D # For this example we will assume that our database is named "climate" and we
##D # access it with user "USER" and password "PASS".  Then we open the connection
##D # with:
##D #
##D library(RODBC)
##D ch <- odbcConnect("climate",uid="USER",pwd="PASS")
##D #
##D # Now we want to use this function to gather all monthly relative humidity
##D # averages for the period 1961-2015, requiring a minimum of 10 years of data
##D # (not necessarily consecutive). We must use the corresponding names of tables
##D # and headers existing the the database, and putting the parameters in the
##D # required order we avoid the need to name them:
##D #
##D db2dat('HRel',1961,2015,10,FALSE,ch,'##D 
##D 'Station','Date','Value','stations','Station','Name','Longitude',
##D 'Latitude','Elevation')
##D #
##D odbcClose(ch) #close the connection if you do not need it anymore
##D #
##D # Our data would now be ready to be homogenized with the homogen function:
##D #
##D homogen('HRel',1961,2015,vmin=0,vmax=100)
##D #
## End(Not run)



