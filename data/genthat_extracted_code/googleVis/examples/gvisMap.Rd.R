library(googleVis)


### Name: gvisMap
### Title: Google Maps with R
### Aliases: gvisMap
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.
  
## Example with latitude and longitude information
## Plot Hurricane Andrew (1992) storm path:

data(Andrew)

M1 <- gvisMap(Andrew, "LatLong" , "Tip",
              options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                           mapType='hybrid', useMapTypeControl=TRUE,
                           width=800,height=400))

plot(M1) 


## Example with address, here UK post-code and some html code in tooltip

df <- data.frame(Postcode=c("EC3M 7HA", "EC2P 2EJ"),
                 Tip=c("<a href='http://www.lloyds.com'>Lloyd's</a>", 
                 "<a href='http://www.guildhall.cityoflondon.gov.uk/'>Guildhall</a>"))
 
M2 <- gvisMap(df, "Postcode", "Tip",
              options=list(showTip=TRUE, mapType='normal',
              enableScrollWheel=TRUE))
 
plot(M2)

## Change mapping icons
M3 <- gvisMap(df, "Postcode", "Tip",
              options=list(showTip=TRUE, mapType='normal',
              enableScrollWheel=TRUE,
              icons=paste0("{",
              "'default': {'normal': 'http://icons.iconarchive.com/",
              "icons/icons-land/vista-map-markers/48/",
              "Map-Marker-Ball-Azure-icon.png',\n",
              "'selected': 'http://icons.iconarchive.com/",
              "icons/icons-land/vista-map-markers/48/",
              "Map-Marker-Ball-Right-Azure-icon.png'",
              "}}")))
                        
plot(M3)



