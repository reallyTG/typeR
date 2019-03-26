library(DescTools)


### Name: IdentifyA
### Title: Identify Points in Plot Lying Within a Rectangle or Polygon
### Aliases: IdentifyA IdentifyA.default IdentifyA.formula
### Keywords: manip

### ** Examples

## Not run: 
##D # run the example via copy and paste
##D 
##D plot(temperature ~ delivery_min, data=d.pizza)
##D idx <- IdentifyA(temperature ~ delivery_min, data=d.pizza)
##D 
##D # you selected the following points
##D d.pizza[idx,]
##D points(temperature ~ delivery_min, data = d.pizza[idx,], col="green")
##D 
##D # use the attr("cond") for subsets in code
##D attr(idx, "cond")
##D 
##D # create a group variable for the found points
##D d.pizza$grp <- seq(nrow(d.pizza)) %in% idx
##D 
##D # try the polygon option
##D idx <- IdentifyA(temperature ~ delivery_min, data=d.pizza, poly=TRUE)
##D points(temperature ~ delivery_min, data = d.pizza[idx,], col="red")
## End(Not run)



