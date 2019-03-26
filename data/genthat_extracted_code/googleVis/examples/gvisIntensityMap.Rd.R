library(googleVis)


### Name: gvisIntensityMap
### Title: Google Intensity Map with R
### Aliases: gvisIntensityMap
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
Intensity1 <- gvisIntensityMap(df, locationvar="country", numvar=c("val1", "val2"))
plot(Intensity1)

## Set colours for each tab
Intensity2 <- gvisIntensityMap(df,
              options=list(colors="['#4682b4', '#0073CF']"))
plot(Intensity2)






