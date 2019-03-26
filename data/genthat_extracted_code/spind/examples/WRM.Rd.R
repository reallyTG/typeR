library(spind)


### Name: WRM
### Title: Wavelet-revised models (WRMs)
### Aliases: WRM plot.WRM summary.WRM predict.WRM

### ** Examples

data(musdata)
coords <- musdata[,4:5]

## Not run: 
##D mwrm <- WRM(musculus ~ pollution + exposure,
##D             family = "poisson",
##D             data = musdata,
##D             coord = coords,
##D             level = 1)
##D 
##D pred <- predict(mwrm, newdata = musdata)
##D 
##D summary(mwrm)
##D 
##D plot(mwrm)
##D 
##D library(ggplot2)
##D 
##D my_wrm_plot <- mwrm$plot
##D 
##D # increase axis text size
##D print(my_wrm_plot + ggplot2::theme(axis.text = element_text(size = 15)))
##D 
## End(Not run)




