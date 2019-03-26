library(FRK)


### Name: df_to_SpatialPolygons
### Title: Convert data frame to SpatialPolygons
### Aliases: df_to_SpatialPolygons

### ** Examples

library(sp)
df <- data.frame(id = c(rep(1,4),rep(2,4)),
                 x = c(0,1,0,0,2,3,2,2),
                 y=c(0,0,1,0,0,1,1,0))
pols <- df_to_SpatialPolygons(df,"id",c("x","y"),CRS())
## Not run: plot(pols)



