library(HistData)


### Name: Langren
### Title: van Langren's Data on Longitude Distance between Toledo and Rome
### Aliases: Langren Langren1644 Langren.all
### Keywords: datasets spatial

### ** Examples

data(Langren1644)

####################################################
# reproductions of Langren's graph overlaid on a map
####################################################

if (require(jpeg, quietly=TRUE)) {

  gimage <- readJPEG(system.file("images", "google-toledo-rome3.jpg", package="HistData"))
  # NB: dimensions from readJPEG are y, x, colors

  gdim <- dim(gimage)[1:2]
  ylim <- c(1,gdim[1])
  xlim <- c(1,gdim[2])
  op <- par(bty="n", xaxt="n", yaxt="n", mar=c(2, 1, 1, 1) + 0.1)
  # NB: necessary to scale the plot to the pixel coordinates, and use asp=1
  plot(xlim, ylim, xlim=xlim, ylim=ylim, type="n", ann=FALSE, asp=1 )
  rasterImage(gimage, 1, 1, gdim[2], gdim[1])

  # pixel coordinates of Toledo and Rome in the image, measured from the bottom left corner
  toledo.map <- c(131, 59)
  rome.map <- c(506, 119)
  
  # confirm locations of Toledo and Rome
  points(rbind(toledo.map, rome.map), cex=2)
  text(131, 95, "Toledo", cex=1.5)
  text(506, 104, "Roma", cex=1.5)

  # set a scale for translation of lat,long to pixel x,y
  scale <- data.frame(x=c(131, 856), y=c(52,52))
  rownames(scale)=c(0,30)

  # translate from degrees longitude to pixels
  xlate <- function(x) {
    131+x*726/30	
  }

  # draw an axis
  lines(scale)
  ticks <- xlate(seq(0,30,5))
  segments(ticks, 52, ticks, 45)
  text(ticks, 40, seq(0,30,5))
  text(xlate(8), 17, "Grados de la Longitud", cex=1.7)

  # label the observations with the names
  points(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), 
         pch=25, col="blue", bg="blue")
  text(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), 
       labels=Langren1644$Name, srt=90, adj=c(-.1, .5), cex=0.8)
  par(op)
}

### Original implementation using ReadImages, now deprecated & shortly to be removed
## Not run: 
##D if (require(ReadImages)) {
##D   gimage <- read.jpeg(system.file("images", "google-toledo-rome3.jpg", package="HistData"))
##D   plot(gimage)
##D   
##D   # pixel coordinates of Toledo and Rome in the image, measured from the bottom left corner
##D   toledo.map <- c(130, 59)
##D   rome.map <- c(505, 119)
##D   
##D   # confirm locations of Toledo and Rome
##D   points(rbind(toledo.map, rome.map), cex=2)
##D   
##D   # set a scale for translation of lat,long to pixel x,y
##D   scale <- data.frame(x=c(130, 856), y=c(52,52))
##D   rownames(scale)=c(0,30)
##D   lines(scale)
##D   
##D   xlate <- function(x) {
##D     130+x*726/30	
##D   }
##D   points(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), 
##D          pch=25, col="blue")
##D   text(x=xlate(Langren1644$Longitude), y=rep(57, nrow(Langren1644)), 
##D          labels=Langren1644$Name, srt=90, adj=c(0, 0.5), cex=0.8)
##D }
## End(Not run)

### First attempt using ggplot2; temporarily abandonned.
## Not run: 
##D require(maps)
##D require(ggplot2)
##D require(reshape)
##D require(plyr)
##D require(scales)
##D 
##D # set latitude to that of Toledo
##D Langren1644$Latitude <- 39.68
##D 
##D #          x/long   y/lat
##D bbox <- c( 38.186, -9.184,
##D            43.692, 28.674 )
##D bbox <- matrix(bbox, 2, 2, byrow=TRUE)
##D 
##D borders <- as.data.frame(map("world", plot = FALSE,
##D   xlim = expand_range(bbox[,2], 0.2),
##D   ylim = expand_range(bbox[,1], 0.2))[c("x", "y")])
##D 
##D data(world.cities)
##D # get actual locations of Toledo & Rome
##D cities <- subset(world.cities,
##D   name %in% c("Rome", "Toledo") & country.etc %in% c("Spain", "Italy"))
##D colnames(cities)[4:5]<-c("Latitude", "Longitude")
##D 
##D mplot <- ggplot(Langren1644, aes(Longitude, Latitude) ) +
##D   geom_path(aes(x, y), borders, colour = "grey60") +
##D   geom_point(y = 40) +
##D   geom_text(aes(label = Name), y = 40.1, angle = 90, hjust = 0, size = 3)
##D mplot <- mplot +
##D 	geom_segment(aes(x=-4.03, y=40, xend=30, yend=40))
##D 
##D mplot <- mplot +
##D   geom_point(data = cities, colour = "red", size = 2) +
##D   geom_text(data=cities, aes(label=name), color="red", size=3, vjust=-0.5) +
##D   coord_cartesian(xlim=bbox[,2], ylim=bbox[,1])
##D 
##D # make the plot have approximately aspect ratio = 1
##D windows(width=10, height=2)
##D mplot
## End(Not run)


###########################################
# show variation in estimates across graphs
###########################################

library(lattice)
graph <- paste(Langren.all$Author, Langren.all$Year)
dotplot(Name ~ Longitude, data=Langren.all)

dotplot( as.factor(Year) ~ Longitude, data=Langren.all, groups=Name, type="o")

dotplot(Name ~ Longitude|graph, data=Langren.all, groups=graph)

# why the gap?
gap.mod <- glm(Gap ~ Year + Source + Latitude, family=binomial, data=Langren1644)
anova(gap.mod, test="Chisq")





