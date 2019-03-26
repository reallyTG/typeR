library(GeoBoxplot)


### Name: boxplot_geog_example
### Title: An example comparing traditional and geograoguic box plots
### Aliases: boxplot_geog_example

### ** Examples

data(pdens2000)
Area<-pdens2000$Area;Popdents<-pdens2000$Popdents;State<-pdens2000$State
boxplot_geog_example(Area,Popdents,State)



