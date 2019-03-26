library(rangemodelR)


### Name: rangemod2d
### Title: Range Cohesion Models for Spatial Polygon Grids
### Aliases: rangemod2d

### ** Examples

if(require(rgdal)&&require(maptools)&&require(rgeos)&&require(ggplot2)){
data(shp)
data(neigh_ob)
data(spmat)
mod.out <- rangemod2d(spmat,shp,"ID",nb = neigh_ob,rsize = "observed",
                       var = NULL,reps = 5)
shp.out <- mod.out$out.shp
shp.out.df <- shp.out@data
shp.out.fort <- fortify(shp.out,region = "ID")
seq <- match(shp.out.fort$id,shp.out.df$ID)
shp.out.gg <- data.frame(shp.out.fort,shp.out.df[seq,])
ggplot(shp.out.gg)+
  geom_map(map=shp.out.gg,aes_string(map_id="id",
                                     fill = "mod.rich"))+
  geom_path(aes(x = long,y = lat,group = group),colour = "white")+
  coord_equal() + theme_bw()+
  scale_fill_continuous(low = "white",high = "black")
}



