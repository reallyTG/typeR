library(SDLfilter)


### Name: depthfilter
### Title: Filter locations by water depth
### Aliases: depthfilter

### ** Examples


#### Load data sets
## Fastloc GPS data obtained from a green turtle
data(turtle)

## Bathymetry model developed by Beaman (2010)
data(bathymodel)

## A tidal plane for the example site
data(tidalplane)

## Tidal observations and predictions for the example site
data(tidedata)

## Maps for the example site
data(SandyStrait)


#### Remove temporal and/or spatial duplicates
turtle.dup <- dupfilter(turtle)


#### Remove biologically unrealistic fixes 
turtle.dd <- ddfilter(turtle.dup, vmax=9.9, qi=4, ia=90, maxvlp=2.0)


#### Apply depthfilter
turtle.dep <- depthfilter(sdata=turtle.dd, 
                          bathymetry=bathymodel, 
                          tide=tidedata, 
                          tidal.plane=tidalplane)


#### Plot data removed or retained by depthfilter
plotMap(turtle.dd, bgmap=SandyStrait, point.size = 2, line.size = 0.5, axes.lab.size = 0, 
         title.size=0, sb.distance=10, multiplot = FALSE)[[1]] + 
geom_point(aes(x=lon, y=lat), data=turtle.dep, size=2, fill="yellow", shape=21)+
geom_point(aes(x=x, y=y), data=data.frame(x=c(152.68, 152.68), y=c(-25.3, -25.34)), 
           size=3, fill=c("yellow", "red"), shape=21) + 
annotate("text", x=c(152.7, 152.7), y=c(-25.3, -25.34), label=c("Retained", "Removed"), 
        colour="black", size=4, hjust = 0)



