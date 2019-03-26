library(MTA)


### Name: gdev
### Title: General Deviation
### Aliases: gdev

### ** Examples

# load data
data("GrandParisMetropole")
# compute absolute global deviation
com$gdevabs <- gdev(x = com, var1 = "INC", var2 = "TH", type = "abs")
# compute relative global deviation
com$gdevrel <- gdev(x = com, var1 = "INC", var2 = "TH", type = "rel")

# Deviations maps
if(require('cartography')){
  library(sp)
  # set graphical parameters
  par(mar = c(0,0,1.2,0))
  # set breaks
  bks <- c(min(com$gdevrel),50,75,100,125,150,max(com$gdevrel))
  cols <- carto.pal(pal1 = "blue.pal", n1 = 3,
                    pal2 = "wine.pal", n2 = 3)
  # plot a choropleth map of the relative global deviation
  choroLayer(spdf = com.spdf, df = com, var = "gdevrel",
             legend.pos = "topleft",
             legend.title.txt = "Relative Deviation",
             breaks = bks, border = NA,
             col = cols)
  # add symbols proportional to the absolute general deviation
  com$sign <- ifelse(test = com$gdevabs<0, yes = "negative", no = "positive")
  propSymbolsTypoLayer(spdf = com.spdf, df = com, var = "gdevabs",var2 = "sign",
                       legend.var.pos = "left",legend.values.rnd = -2, 
                       legend.var2.values.order = c("positive", "negative"),
                       legend.var.title.txt = "Absolute Deviation",
                       col = c("#ff000050","#0000ff50"),legend.var2.pos = "n",
                       legend.var.style = "e", inches = 0.2)
  # add EPT boundaries
  plot(ept.spdf, add=TRUE)
  # add a layout
  layoutLayer(title = "General Deviation (reference: Grand Paris Metropole)",
              sources = "GEOFLA® 2015 v2.1, Apur, impots.gouv.fr", 
              north = TRUE,
              author = "MTA")
}



