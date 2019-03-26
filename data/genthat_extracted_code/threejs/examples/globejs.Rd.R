library(threejs)


### Name: globejs
### Title: Plot Data on 3D Globes
### Aliases: globejs

### ** Examples

# Plot flights to frequent destinations from Callum Prentice's
# global flight data set,
# http://callumprentice.github.io/apps/flight_stream/index.html
data(flights)
# Approximate locations as factors
dest   <- factor(sprintf("%.2f:%.2f",flights[,3], flights[,4]))
# A table of destination frequencies
freq <- sort(table(dest), decreasing=TRUE)
# The most frequent destinations in these data, possibly hub airports?
frequent_destinations <- names(freq)[1:10]
# Subset the flight data by destination frequency
idx <- dest %in% frequent_destinations
frequent_flights <- flights[idx, ]
# Lat/long and counts of frequent flights
ll <- unique(frequent_flights[,3:4])
# Plot frequent destinations as bars, and the flights to and from
# them as arcs. Adjust arc width and color by frequency.
globejs(lat=ll[,1], long=ll[,2], arcs=frequent_flights, bodycolor="#aaaaff",
        arcsHeight=0.3, arcsLwd=2, arcsColor="#ffff00", arcsOpacity=0.15,
        atmosphere=TRUE, color="#00aaff", pointsize=0.5)

## Not run: 
##D # Plot populous world cities from the maps package.
##D library(threejs)
##D library(maps)
##D data(world.cities, package="maps")
##D cities <- world.cities[order(world.cities$pop, decreasing=TRUE)[1:1000],]
##D value  <- 100 * cities$pop / max(cities$pop)
##D col <- colorRampPalette(c("cyan", "lightgreen"))(10)[floor(10 * value/100) + 1]
##D globejs(lat=cities$lat, long=cities$long, value=value, color=col, atmosphere=TRUE)
##D 
##D # Plot the data on the moon:
##D moon <- system.file("images/moon.jpg", package="threejs")
##D globejs(img=moon, bodycolor="#555555", lightcolor="#aaaaaa",
##D         lat=cities$lat, long=cities$long,
##D         value=value, color=col)
##D 
##D # Using global plots from the maptools, rworldmap, or sp packages.
##D 
##D # Instead of using ready-made images of the earth, we can use
##D # many R spatial imaging packages to produce globe images
##D # dynamically. With a little extra effort you can build globes with total
##D # control over how they are plotted.
##D 
##D library(maptools)
##D library(threejs)
##D data(wrld_simpl)
##D 
##D bgcolor <- "#000025"
##D earth <- tempfile(fileext=".jpg")
##D 
##D # NOTE: Use antialiasing to smooth border boundary lines. But! Set the jpeg
##D # background color to the globe background color to avoid a visible aliasing
##D # effect at the the plot edges.
##D 
##D jpeg(earth, width=2048, height=1024, quality=100, bg=bgcolor, antialias="default")
##D par(mar = c(0,0,0,0), pin = c(4,2), pty = "m",  xaxs = "i",
##D     xaxt = "n",       xpd = FALSE,  yaxs = "i", bty = "n", yaxt = "n")
##D plot(wrld_simpl, col="black", bg=bgcolor, border="cyan", ann=FALSE,
##D      setParUsrBB=TRUE)
##D dev.off()
##D globejs(earth)
##D 
##D # A shiny example:
##D shiny::runApp(system.file("examples/globe",package="threejs"))
## End(Not run)

# See http://bwlewis.github.io/rthreejs for additional examples.



