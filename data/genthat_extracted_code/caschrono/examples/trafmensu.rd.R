library(caschrono)


### Name: trafmensu
### Title: Monthly Air traffic at Toulouse Blagnac Airport for the period
###   1993-2007
### Aliases: trafmensu
### Keywords: datasets

### ** Examples

data(trafmensu)
# The executed code is : 
## Not run: 
bb=read.table(file= system.file("/import/trafquoti.txt",package="caschrono"),
header=FALSE,quote="",sep="", colClasses=c('numeric','character'),
col.names =c('trafic','date'))
mois.an= as.numeric(paste(substr(bb$date,1,4), substr(bb$date,6,7), sep=""))
trafmens=aggregate(bb$traf, list(Mois.An = mois.an), sum)
trafmensu=ts(trafmens$x/1000,start= c(1993,1),frequency= 12)
## End(Not run)



