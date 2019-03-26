library(seismicRoll)


### Name: roll_stalta
### Title: Rolling STA/LTA
### Aliases: roll_stalta

### ** Examples

# Contrived example
x <- rep(c(1,5,3,2,1),each=20)
p <- roll_stalta(x,3,6)
plot(x, pch=17, cex=0.8, ylim=c(0,max(x)),
     main="Test of roll_stalta on artificial data")
points(p,cex=1.5,col='red',type='b')
legend('topleft',
       legend=c('data','STA/LTA'),
       pch=c(17,1),
       col=c('black','red'))

# Real example requiring the 'seismic' package
## Not run: 
##D require(seismic)
##D  
##D # Create a new IrisClient
##D iris <- new("IrisClient")
##D   
##D # Seismic data with a large quake
##D starttime <- as.POSIXct("2010-02-27 06:30:00", tz="GMT")
##D endtime <- as.POSIXct("2010-02-27 07:00:00", tz="GMT")
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D tr <- st@traces[[1]]
##D  
##D # Preprocess the data
##D x <- DDT(tr)@data
##D  
##D # Calculate the first break 'picker'
##D n_sta <- 3 * tr@stats@sampling_rate
##D n_lta <- 10 * n_sta
##D p <- roll_stalta(x^2,n_sta,n_lta)
##D  
##D first_break <- which(p == max(p,na.rm=TRUE))
##D 
##D plot(x,type='l',
##D      main='Test of STA/LTA first break picker on raw seismic data')
##D abline(v=first_break,col='red')  
## End(Not run)



