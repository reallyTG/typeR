library(OpenStreetMap)


### Name: autoplot.OpenStreetMap
### Title: Plot an open street map using ggplot2
### Aliases: autoplot.OpenStreetMap

### ** Examples

## Not run: 
##D require(maps)
##D require(ggplot2)
##D 
##D mp <- openmap(c(53.38332836757155,-130.517578125),
##D 		c(15.792253570362446,-67.939453125),4,'stamen-watercolor')
##D mp_bing <- openmap(c(53.38332836757155,-130.517578125),
##D 		c(15.792253570362446,-67.939453125),4,'bing')
##D states_map <- map_data("state")
##D states_map_merc <- as.data.frame(
##D 		projectMercator(states_map$lat,states_map$long))
##D states_map_merc$region <- states_map$region
##D states_map_merc$group <- states_map$group
##D crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
##D 
##D p <- autoplot(mp,expand=FALSE) + geom_polygon(aes(x=x,y=y,group=group),
##D 		data=states_map_merc,fill="black",colour="black",alpha=.1) + theme_bw()
##D print(p)
##D p <- autoplot(mp_bing) + geom_map(aes(x=-10000000,y=4000000,map_id=state,fill=Murder),
##D 		data=crimes,map=states_map_merc)
##D print(p)
## End(Not run)



