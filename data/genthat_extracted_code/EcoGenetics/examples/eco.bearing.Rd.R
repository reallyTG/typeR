library(EcoGenetics)


### Name: eco.bearing
### Title: Angular Spatial Weights
### Aliases: eco.bearing

### ** Examples


## Not run: 
##D 
##D data(eco3)
##D 
##D "circle" method
##D 
##D con <- eco.weight(eco3[["XY"]], method = "circle", d1 = 0, d2 = 500)
##D bearing_con <- eco.bearing(con, 90)
##D 
##D W_list <- eco.lagweight(eco[["XY"]]) 
##D bearing_W_list <- eco.bearing(W_list, 90)
##D 
## End(Not run)




