library(googleVis)


### Name: gvisOrgChart
### Title: Google Org Chart with R
### Aliases: gvisOrgChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

Regions
Org1 <- gvisOrgChart(Regions, idvar = "Region", parentvar = "Parent", 
     			      tipvar="Val")
plot(Org1)

## Set a few options
Org2 <- gvisOrgChart(Regions, idvar = "Region", parentvar = "Parent", 
     			      tipvar="Val", 
     		     options=list(width=600, height=400,
                     	          size='large', allowCollapse=TRUE))
plot(Org2)




