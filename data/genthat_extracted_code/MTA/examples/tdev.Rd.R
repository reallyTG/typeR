library(MTA)


### Name: tdev
### Title: Territorial Deviation
### Aliases: tdev

### ** Examples

# load data
data("GrandParisMetropole")
# compute absolute territorial deviation (EPT level)
com$tdevabs <- tdev(x = com, var1 = "INC", var2 = "TH", type = "abs", 
                              key = "EPT")
# compute relative territorial deviation (EPT level)
com$tdevrel <- tdev(x = com, var1 = "INC", var2 = "TH", type = "rel", 
                              key = "EPT")

# map deviations
if(require('cartography')){
  library(sp)
  # set graphical parameters
  par(mar = c(0,0,1.2,0))
  # set breaks
  bks <- c(min(com$tdevrel),75,100,125,150,max(com$tdevrel))
  # set colot palette
  cols <- carto.pal(pal1 = "blue.pal", n1 = 2,
                    pal2 = "wine.pal", n2 = 3)
  # plot a choropleth map of the relative territorial deviation
  choroLayer(spdf = com.spdf, df = com, var = "tdevrel",
             legend.pos = "topleft",
             breaks = bks, border = NA,
             col = cols)
  # add symbols proportional to the absolute territorial deviation
  com$sign <- ifelse(test = com$tdevabs<0, yes = "negative", no = "positive")
  propSymbolsTypoLayer(spdf = com.spdf, df = com, var = "tdevabs",var2 = "sign",
                       legend.var.pos = "left",legend.values.rnd = -2, 
                       legend.var2.values.order = c("positive", "negative"),
                       legend.var.title.txt = "Absolute Deviation",
                       col = c("#ff000050","#0000ff50"),legend.var2.pos = "n",
                       legend.var.style = "e", inches = 0.2)
  # add EPT boundaries
  plot(ept.spdf, add=TRUE)
  # add a layout
  layoutLayer(title = "Territorial Deviation",
              sources = "GEOFLA® 2015 v2.1, Apur, impots.gouv.fr", 
              author = "MTA")
}



