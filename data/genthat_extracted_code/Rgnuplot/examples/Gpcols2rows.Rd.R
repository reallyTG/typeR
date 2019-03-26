library(Rgnuplot)


### Name: Gpcols2rows
### Title: convert a file with columns to rows
### Aliases: Gpcols2rows
### Keywords: programming

### ** Examples

#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory 
# from Rgnuplot (default)
Gpsetloadpath(h1)
#change gnuplot's working directory to be the same as 
#R's working directory (default)
Gpsetwd(h1)
## Not run: 
##D nordklim <- read.table(system.file('extdata/NordklimData.tab', package = 
##D "Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)
##D 
##D NKmonths <- c('January','February','March','April','May','June','July','August',
##D 'September','October','November','December')
##D #choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
##D nordklimHelsinkiPrecipitation <- nordklim[which((nordklim$NordklimNumber==304) &
##D (nordklim$CountryCode=='FIN') & (nordklim$ClimateElement==601)),c('FirstYear',
##D NKmonths)]
##D nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
##D #save to a data file
##D Gpmatrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')
##D 
##D #convert the data file from 12 columns for the monthly data to 2 rows
##D Gpcols2rows('NORDKLIM-Helsinki-prec.dat','NORDKLIM-Helsinki-prec-columns.dat')
## End(Not run)
#close gnuplot handle
h1<-Gpclose(h1)



