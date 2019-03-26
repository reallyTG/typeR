library(spind)


### Name: GEE
### Title: GEE (Generalized Estimating Equations)
### Aliases: GEE plot.GEE predict.GEE summary.GEE

### ** Examples

data(musdata)
coords<- musdata[,4:5]

## Not run: 
##D mgee <- GEE(musculus ~ pollution + exposure,
##D             family = "poisson",
##D             data =  musdata,
##D             coord = coords,
##D             corstr = "fixed",
##D             scale.fix = FALSE)
##D 
##D summary(mgee, printAutoCorPars = TRUE)
##D 
##D pred <- predict(mgee, newdata = musdata)
##D 
##D library(ggplot2)
##D 
##D plot(mgee)
##D 
##D my_gee_plot <- mgee$plot
##D 
##D # move the legend to a new position
##D print(my_gee_plot + ggplot2::theme(legend.position = 'top'))
##D 
## End(Not run)



