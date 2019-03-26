library(ClimClass)


### Name: ExAtRa
### Title: Extra-Atmospheric Radiation
### Aliases: ExAtRa

### ** Examples


data(Trent_climate)
# creates a vector with middle days for every month in a year
quinci   <- paste(15,"/",1:12,"/",2014,sep="")
posixlt  <- strptime(quinci, format="%d/%m/%Y")
yDay     <- posixlt$yday+1  # field yday starts from 0
latitude<-46  

# generates 12 values, one for each month
coeff_rad<- ExAtRa(DOY=yDay,latitude=latitude, unit="mm")




