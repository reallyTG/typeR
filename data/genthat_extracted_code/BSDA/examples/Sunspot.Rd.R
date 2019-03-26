library(BSDA)


### Name: Sunspot
### Title: Wolfer sunspot numbers from 1700 through 2000
### Aliases: Sunspot
### Keywords: datasets

### ** Examples


plot(sunspots ~ year, data = Sunspot, type = "l")
## Not run: 
##D library(ggplot2)
##D lattice::xyplot(sunspots ~ year, data = Sunspot, 
##D                 main = "Yearly sunspots", type = "l")
##D lattice::xyplot(sunspots ~ year, data = Sunspot, type = "l", 
##D                 main = "Yearly sunspots", aspect = "xy")
##D ggplot2::ggplot(data = Sunspot, aes(x = year, y = sunspots)) + 
##D            geom_line() + 
##D            theme_bw()
## End(Not run)




