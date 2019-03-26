library(bclust)


### Name: viplot
### Title: variable importance plot
### Aliases: viplot

### ** Examples

data(gaelle)
gaelle.bclust<-bclust(gaelle,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68))
gaelle.imp<-imp(gaelle.bclust)
viplot(varimp=gaelle.imp$var)
# solid plot 

viplot(varimp=gaelle.imp$var,xlab=imp(gaelle.bclust)$labels,
sort=TRUE,col=heat.colors(length(gaelle.imp$var))) 
# sorted plot with heat colors and labels



