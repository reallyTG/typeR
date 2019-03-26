library(MTA)


### Name: sdev
### Title: Spatial Deviation
### Aliases: sdev

### ** Examples

# load data
data("GrandParisMetropole")
# compute absolute spatial deviation in a neighborhood defined by a contiguity 
# order of 2.
com$sdevabs <- sdev(x = com, var1 = "INC", var2 = "TH", 
                          type = "abs", spdf = com.spdf, order = 2)

# compute relative spatial deviation in a neighborhood defined within a distance 
# of 5km between communes' centroids 
com$sdevrel <- sdev(x = com, var1 = "INC", var2 = "TH", type = "rel", 
                          spdf = com.spdf, dist = 5000)

# compute absolute spatial deviation in a neighborhood defined within a road 
# travel time of 10 minutes by car
com$scardevabs <- sdev(x = com, var1 = "INC", var2 = "TH", type = "abs", 
                             spdf = com.spdf, dist = 10, mat = cardist)
# compute relative spatial deviation in a neighborhood defined within a road 
# travel time of 10 minutes by car
com$scardevrel <- sdev(x = com, var1 = "INC", var2 = "TH", type = "rel", 
                             spdf = com.spdf, dist = 10, mat = cardist)

# map deviations
if(require('cartography')){
  library(sp)
  # set graphical parameters
  par(mar = c(0,0,1.2,0))
  # set breaks
  bks <- c(min(com$scardevrel),50,75,100,125,150,max(com$scardevrel))
  bks <- sort(bks)
  # set colot palette
  cols <- carto.pal(pal1 = "blue.pal", n1 = 3,
                    pal2 = "wine.pal", n2 = 3)
  # plot a choropleth map of the relative spatial deviation
  choroLayer(spdf = com.spdf, df = com, var = "scardevrel",
             legend.pos = "topleft",
             legend.title.txt = "Relative Deviation",
             breaks = bks, border = NA,
             col = cols)
  # add symbols proportional to the absolute spatial deviation
  com$sign <- ifelse(test = com$scardevabs<0, yes = "negative", no = "positive")
  propSymbolsTypoLayer(spdf = com.spdf, df = com, var = "scardevabs",var2 = "sign",
                       legend.var.pos = "left",legend.values.rnd = -2, 
                       legend.var2.values.order = c("positive", "negative"),
                       legend.var.title.txt = "Absolute Deviation",
                       col = c("#ff000050","#0000ff50"),legend.var2.pos = "n",
                       legend.var.style = "e", inches = 0.2)
  # add a layout
  layoutLayer(title = "Spatial Deviation (neighborhoud: 10 minutes by car)",
              sources = "GEOFLA® 2015 v2.1, impots.gouv.fr", north = TRUE,
              author = "MTA")
}



