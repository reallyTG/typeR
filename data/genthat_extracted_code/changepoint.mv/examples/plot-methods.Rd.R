library(changepoint.mv)


### Name: plot
### Title: Visualisation of data and changepoint locations.
### Aliases: plot plot,changepoint.mv.mrc.class,ANY-method

### ** Examples

## Not run: 
##D # visualising most recent changepoints 
##D data(mrcexample)
##D res<-mrc(mrcexample[,1:10])
##D p.1<-plot(res,p=2)
##D p.2<-plot(res,p=5)
##D p.3<-plot(res,p=2,group=TRUE)
##D p.4<-plot(res,p=5,group=TRUE)
##D if(require(gridExtra))
##D {
##D   grid.arrange(p.1,p.2,p.3,p.4)
##D }
## End(Not run)



