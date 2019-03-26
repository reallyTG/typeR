library(FRK)


### Name: SpatialPolygonsDataFrame_to_df
### Title: SpatialPolygonsDataFrame to df
### Aliases: SpatialPolygonsDataFrame_to_df

### ** Examples

library(sp)
library(ggplot2)
opts_FRK$set("parallel",0L)
df <- data.frame(id = c(rep(1,4),rep(2,4)),
                 x = c(0,1,0,0,2,3,2,2),
                 y=c(0,0,1,0,0,1,1,0))
pols <- df_to_SpatialPolygons(df,"id",c("x","y"),CRS())
polsdf <- SpatialPolygonsDataFrame(pols,data.frame(p = c(1,2),row.names=row.names(pols)))
df2 <- SpatialPolygonsDataFrame_to_df(polsdf)
## Not run: ggplot(df2,aes(x=x,y=y,group=id)) + geom_polygon()



