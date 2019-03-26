library(PROTOLIDAR)


### Name: PROTOLIDAR-package
### Title: PRocess TOol LIdar DAta in R.
### Aliases: PROTOLIDAR-package PROTOLIDAR
### Keywords: datasets array aplot math

### ** Examples

## Should be DIRECTLY executable !! 
## For example:
   data (LIDAR_data)
   x <- LIDAR_data [,1]
   y <- LIDAR_data [,2]
   z <- LIDAR_data [,3]
   zdistance <- 190 # total LIDAR scan distance measured in cm.
   miny <- 0 # minimum height of the plant measured in cm.
   maxy <- 2000 # maximum height of the plant measured in cm.
   minx <- 450 # minimum width from where LIDAR starts to measure (cm).
   maxx <- 1470# maximum width from where LIDAR starts to measure (cm).
   minz <- 0 # the beginning of the LIDAR scan measured in cm.
   maxz <- 186 # the end of the LIDAR scan measured in cm (length of interest).
  
## The function is currently defined as
  Extract_plant_grapevine_function <- function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz){
      y <- -y
      y <- y-min(y)
      z<- (z*zdistance)/max(z)
      x_cm <- 0
      y_cm <- 0
      z_cm <- 0
      for (i in 1:length(x)){ 
        if (x[i] >= minx  && x[i] <= maxx && y[i] >= miny && y[i] <= maxy &&  z[i] >= minz  && z[i] <= maxz) {  
          y_cm[i] <- y[i]
          x_cm[i] <- x[i]
          z_cm[i] <- z[i]
        }
      }
      y_cm <- na.omit(y_cm[2:length(y_cm)])
      y_cm <- as.numeric((y_cm-min(y_cm))/1000)
      x_cm <- as.numeric(na.omit(x_cm[2:length(x_cm)])/1000)
      z_cm <- as.numeric(na.omit(z_cm[2:length(z_cm)])/100)
      return <- data.frame(x_cm,y_cm,z_cm)
    }
    out <- Extract_plant_grapevine_function(x,y,z,zdistance,miny,maxy,minx,maxx,minz,maxz)
      
       x = out[,1]
       y = out[,2]
       z = out[,3]
      # plot
       par(mfcol=c(2,2))
       plot(x,y,pch=20,cex=.4,xlab='Width (m)', ylab='Height (m)', main='Grapevine BBCH')
       plot(x,z,pch=20,cex=.4,xlab='Width (m)', ylab='Front (m)', main='Grapevine BBCH')
       plot(z,y,pch=20,cex=.4,xlab='Front (m)', ylab='Height (m)', main='Grapevine BBCH')



