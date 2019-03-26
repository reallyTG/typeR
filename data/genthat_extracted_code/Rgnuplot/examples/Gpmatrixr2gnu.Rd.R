library(Rgnuplot)


### Name: Gpmatrixr2gnu
### Title: Save R matrix in gnuplot format
### Aliases: Gpmatrixr2gnu
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory from 
#Rgnuplot (default)
Gpsetloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory 
#(default)
Gpsetwd(h1)
## Not run: 
##D nordklim <- read.table(system.file('extdata/NordklimData.tab', package = 
##D "Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)
##D NKmonths <- c('January','February','March','April','May','June','July',
##D 'August','September','October','November','December')
##D #choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
##D nordklimHelsinkiPrecipitation <- nordklim[which((nordklim$NordklimNumber==304) &
##D (nordklim$CountryCode=='FIN') & (nordklim$ClimateElement==601)),c('FirstYear',
##D NKmonths)]
##D nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
##D #save to a data file
##D Gpmatrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



