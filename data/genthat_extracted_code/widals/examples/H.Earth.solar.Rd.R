library(widals)


### Name: H.Earth.solar
### Title: Solar Radiation
### Aliases: H.Earth.solar
### Keywords: ~kwd1 ~kwd2

### ** Examples


lat <- c(0, -88)
lon <- c(0, 0)
dateDate <- strptime( c('20120621', '20120320'), '%Y%m%d')

H.Earth.solar(lon, lat, dateDate)


## The function is currently defined as
function (x, y, dateDate) 
{
    Hst.ls <- list()
    n <- length(y)
    tau <- length(dateDate)
    equinox <- strptime("20110320", "%Y%m%d")
    for (i in 1:tau) {
        this.date <- dateDate[i]
        dfe <- as.integer(difftime(this.date, equinox, units = "day"))
        dfe
        psi <- 23.5 * sin(2 * pi * dfe/365.25)
        psi
        eta <- 90 - (360/(2 * pi)) * acos(cos(2 * pi * y/360) * 
            cos(2 * pi * psi/360) + sin(2 * pi * y/360) * sin(2 * 
            pi * psi/360))
        surface.area <- sin(2 * pi * eta/360)
        surface.area
        Hst.ls[[i]] <- cbind(surface.area)
    }
    return(Hst.ls)
  }



