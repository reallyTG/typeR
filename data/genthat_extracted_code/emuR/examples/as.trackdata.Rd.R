library(emuR)


### Name: as.trackdata
### Title: Create an Emu trackdata object
### Aliases: as.trackdata
### Keywords: misc

### ** Examples



# make a trackdata object of two data segments
data1 <- matrix( 1:10, ncol=2 )
data2 <- matrix( 11:20, ncol=2 )

nd1 <- nrow(data1)
nd2 <- nrow(data2)
index <- rbind( c( 1, nd1 ), c(nd1+1,nd1+nd2) )

times <- rbind( c( 100.0, 110.0 ), c( 200.0, 210.0 ) )

tdata <- as.trackdata( rbind( data1, data2 ), index, times, trackname="fake")

# describe the data
summary(tdata)
# get the data for the first segment
tdata[1]
# and the second
tdata[2]





