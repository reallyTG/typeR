## ---- fig.width=5, fig.height=5, results='hide', warning=FALSE, error=FALSE, message=FALSE, echo=FALSE, fig.align='center'----
#Generate cover picture
library(dggridR)
#Generate grids of various sizes
hdggses <- lapply(3:5, function(res) dgconstruct(res=res))
hgrids  <- lapply(hdggses, function(dggs) dgearthgrid(dggs))

countries <- map_data("world")

orthobase <-ggplot() + 
    geom_polygon(data=countries,  aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    scale_fill_gradient(low="blue", high="red")+
    coord_map("ortho", orientation = c(0, 90, 0))+
    #coord_map("ortho", orientation = c(-89.49831, -179.9223, 0))+
    xlab('')+ylab('')+
    theme(axis.ticks.x=element_blank())+
    theme(axis.ticks.y=element_blank())+
    theme(axis.text.x=element_blank())+
    theme(axis.text.y=element_blank())

for(i in 1:3) {
  cellstosave <- (hgrids[[i]] %>% group_by(group) %>% summarise(long=max(long)) %>% filter((i-1)*70-5<=long & long<=i*70+5))$group
  hgrids[[i]] <- hgrids[[i]] %>% filter(group %in% cellstosave)
}

orthobase+
 geom_path(data=hgrids[[1]], aes(x=long, y=lat, group=group), alpha=1, color="#1B9E77")+
 geom_path(data=hgrids[[2]], aes(x=long, y=lat, group=group), alpha=1, color="#D95F02")+
 geom_path(data=hgrids[[3]], aes(x=long, y=lat, group=group), alpha=1, color="#7570B3")

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE----------
#Include libraries
library(dggridR)
library(dplyr)

#Construct a global grid with cells approximately 1000 miles across
dggs          <- dgconstruct(spacing=1000, metric=FALSE, resround='down')

#Load included test data set
data(dgquakes)

#Get the corresponding grid cells for each earthquake epicenter (lat-long pair)
dgquakes$cell <- dgGEO_to_SEQNUM(dggs,dgquakes$lon,dgquakes$lat)$seqnum

#Converting SEQNUM to GEO gives the center coordinates of the cells
cellcenters   <- dgSEQNUM_to_GEO(dggs,dgquakes$cell)

#Get the number of earthquakes in each cell
quakecounts   <- dgquakes %>% group_by(cell) %>% summarise(count=n())

#Get the grid cell boundaries for cells which had quakes
grid          <- dgcellstogrid(dggs,quakecounts$cell,frame=TRUE,wrapcells=TRUE)

#Update the grid cells' properties to include the number of earthquakes
#in each cell
grid          <- merge(grid,quakecounts,by.x="cell",by.y="cell")

#Make adjustments so the output is more visually interesting
grid$count    <- log(grid$count)
cutoff        <- quantile(grid$count,0.9)
grid          <- grid %>% mutate(count=ifelse(count>cutoff,cutoff,count))

#Get polygons for each country of the world
countries <- map_data("world")

## ---- fig.width=6, fig.height=4------------------------------------------
#Plot everything on a flat map
p<- ggplot() + 
    geom_polygon(data=countries, aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    geom_polygon(data=grid,      aes(x=long, y=lat, group=group, fill=count), alpha=0.4)    +
    geom_path   (data=grid,      aes(x=long, y=lat, group=group), alpha=0.4, color="white") +
    geom_point  (aes(x=cellcenters$lon_deg, y=cellcenters$lat_deg)) +
    scale_fill_gradient(low="blue", high="red")
p

## ---- fig.width=6, fig.height=6------------------------------------------
#Replot on a spherical projection
p+coord_map("ortho", orientation = c(-38.49831, -179.9223, 0))+
  xlab('')+ylab('')+
  theme(axis.ticks.x=element_blank())+
  theme(axis.ticks.y=element_blank())+
  theme(axis.text.x=element_blank())+
  theme(axis.text.y=element_blank())+
  ggtitle('Your data could look like this')

## ---- eval=FALSE---------------------------------------------------------
#  library(rgdal)
#  
#  #Get the grid cell boundaries for the whole Earth using this dggs in a form
#  #suitable for printing to a KML file
#  grid          <- dgearthgrid(dggs,frame=FALSE)
#  
#  #Update the grid cells' properties to include the number of earthquakes
#  #in each cell
#  grid@data$count <- merge(grid@data, quakecounts, by.x="cell", by.y="cell", all.x=TRUE)$count
#  
#  #Write out the grid
#  writeOGR(grid, "quakes_per_cell.kml", "quakes", "KML")

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE----------
#Include libraries
library(dggridR)
library(rgdal)
library(dplyr)

N <- 100    #How many cells to sample

#Distribute the points uniformly on a sphere using equations from
#http://mathworld.wolfram.com/SpherePointPicking.html
u     <- runif(N)
v     <- runif(N)
theta <- 2*pi*u      * 180/pi
phi   <- acos(2*v-1) * 180/pi
lon   <- theta-180
lat   <- phi-90

df    <- data.frame(lat=lat,lon=lon)

#Construct a global grid in which every hexagonal cell has an area of
#100,000 miles^2. You could, of course, choose a much smaller value, but these
#will show up when I map them later.

#Note: Cells can only have certain areas, the `dgconstruct()` function below
#will tell you which area is closest to the one you want. You can also round
#up or down.

#Note: 12 cells are actually pentagons with an area 5/6 that of the hexagons
#But, with millions and millions of hexes, you are unlikely to choose one
#Future versions of the package will make it easier to reject the pentagons
dggs    <- dgconstruct(area=100000, metric=FALSE, resround='nearest')

#Get the corresponding grid cells for each randomly chosen lat-long
df$cell <- dgGEO_to_SEQNUM(dggs,df$lon,df$lat)$seqnum

#Get the hexes for each of these cells
gridfilename <- dgcellstogrid(dggs,df$cell)

## ---- fig.width=6, fig.height=4------------------------------------------
#Get the grid in a more convenient format
grid           <- dgcellstogrid(dggs,df$cell,frame=TRUE,wrapcells=TRUE)

#Get polygons for each country of the world
countries      <- map_data("world")

#Plot everything on a flat map
p<- ggplot() + 
    geom_polygon(data=countries, aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    geom_polygon(data=grid,      aes(x=long, y=lat, group=group), fill="green", alpha=0.4)    +
    geom_path   (data=grid,      aes(x=long, y=lat, group=group), alpha=0.4, color="white")
p

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE----------
#Include libraries
library(dggridR)
library(dplyr)

N <- 100    #How many cells to sample

#Construct a global grid in which every hexagonal cell has an area of
#100,000 miles^2. You could, of course, choose a much smaller value, but these
#will show up when I map them later.

#Note: Cells can only have certain areas, the `dgconstruct()` function below
#will tell you which area is closest to the one you want. You can also round
#up or down.

#Note: 12 cells are actually pentagons with an area 5/6 that of the hexagons
#But, with millions and millions of hexes, you are unlikely to choose one
#Future versions of the package will make it easier to reject the pentagons
dggs    <- dgconstruct(area=100000, metric=FALSE, resround='nearest')

maxcell <- dgmaxcell(dggs)                     #Get maximum cell id
cells   <- sample(1:maxcell, N, replace=FALSE) #Choose random cells
grid    <- dgcellstogrid(dggs,cells,frame=TRUE,wrapcells=TRUE) #Get grid

## ---- fig.width=6, fig.height=4------------------------------------------
#Get the grid in a more convenient format
grid           <- dgcellstogrid(dggs,df$cell,frame=TRUE,wrapcells=TRUE)

#Get polygons for each country of the world
countries      <- map_data("world")

#Plot everything on a flat map
p<- ggplot() + 
    geom_polygon(data=countries, aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    geom_polygon(data=grid,      aes(x=long, y=lat, group=group), fill="green", alpha=0.4)    +
    geom_path   (data=grid,      aes(x=long, y=lat, group=group), alpha=0.4, color="white")
p

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE----------
library(dggridR)
#Generate a global grid whose cells are ~100,000 miles^2
dggs         <- dgconstruct(area=100000, metric=FALSE, resround='nearest')
#Save the cells to a KML file for use in other software
gridfilename <- dgearthgrid(dggs,savegrid=tempfile())

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE, fig.align='center', fig.width=5, fig.height=5----
library(dggridR)

#Generate a dggs specifying an intercell spacing of ~25 miles
dggs      <- dgconstruct(spacing=100, metric=FALSE, resround='nearest')

#Read in the South Africa's borders from the shapefile
sa_border <- readOGR(dsn=dg_shpfname_south_africa(), layer="ZAF_adm0")

#Get a grid covering South Africa
sa_grid   <- dgshptogrid(dggs, dg_shpfname_south_africa())

#Plot South Africa's borders and the associated grid
p<- ggplot() + 
    geom_polygon(data=sa_border, aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    geom_polygon(data=sa_grid,   aes(x=long, y=lat, group=group), fill="blue", alpha=0.4)   +
    geom_path   (data=sa_grid,   aes(x=long, y=lat, group=group), alpha=0.4, color="white") +
    coord_equal()
p

## ---- results='hide', warning=FALSE, error=FALSE, message=FALSE, fig.align='center', fig.width=6, fig.height=4, echo=FALSE----

lat <- c(90,-90,26.57,-26.57,26.57,-26.57,26.57,-26.57,26.57,-26.57,26.57,-26.57)
lon <- c(0,0,0,36,72,108,144,180,216,252,288,324)

dggs  <- dgconstruct(area=100000, metric=FALSE, resround='nearest')
cells <- dgGEO_to_SEQNUM(dggs,lon,lat)$seqnum
grid  <- dgcellstogrid(dggs,cells,frame=TRUE,wrapcells=TRUE) #Get grid

#Get polygons for each country of the world
countries      <- map_data("world")

#Plot everything on a flat map
p<- ggplot() + 
    geom_polygon(data=countries, aes(x=long, y=lat, group=group), fill=NA, color="black")   +
    geom_polygon(data=grid,      aes(x=long, y=lat, group=group), alpha=0.6, fill="purple")    +
    geom_path   (data=grid,      aes(x=long, y=lat, group=group), alpha=0.4, color="white")
p

