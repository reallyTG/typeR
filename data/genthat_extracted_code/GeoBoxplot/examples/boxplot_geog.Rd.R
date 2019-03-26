library(GeoBoxplot)


### Name: boxplot_geog
### Title: Geographic Box Plot
### Aliases: boxplot_geog

### ** Examples

data(pdens2000)
area<-pdens2000$Area;data<-pdens2000$Popdents;fence=1;groups<-pdens2000$Region
boxplot_geog(area,data,fence,groups)



