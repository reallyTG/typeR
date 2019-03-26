library(mosaic)


### Name: sp2df
### Title: Transforms a shapefile into a dataframe
### Aliases: sp2df

### ** Examples


## Not run: 
##D  
##D if(require(maptools)) {
##D   data(wrld_simpl)
##D   worldmap <- sp2df(wrld_simpl)
##D }
##D 
##D if ( require(ggplot2) && require(maptools) ) { 
##D   data(wrld_simpl)
##D   World <- sp2df(wrld_simpl)
##D   World2 <- merge(World, Countries, by.x="NAME", by.y="maptools", all.y=FALSE)
##D   Mdata <- merge(Alcohol, World2, by.x="country", by.y="gapminder", all.y=FALSE) 
##D   Mdata <- Mdata[order(Mdata$order),]
##D   qplot( x=long, y=lat, fill=ntiles(alcohol,5), 
##D          data=subset(Mdata, year==2008), group = group, 
##D                      geom="polygon")
##D }
## End(Not run)



