library(itsadug)


### Name: plot_topo
### Title: Visualization of EEG topo maps.
### Aliases: plot_topo

### ** Examples


data(eeg)

## Not run: 
##D # simple GAMM model:
##D m1 <- gam(Ampl ~ te(Time, X, Y, k=c(10,5,5), 
##D     d=c(1,2)), data=eeg)
##D 
##D # topo plot, by default uses fvisgam 
##D # and automatically selects a timestamp (270ms):
##D plot_topo(m1, view=c("X", "Y"))
##D # or:
##D plot_topo(m1, view=c("X", "Y"), setmargins=FALSE, size=1)
##D 
##D # add electrodes:
##D electrodes <- eeg[,c('X','Y','Electrode')]
##D electrodes <- as.list( electrodes[!duplicated(electrodes),] )
##D plot_topo(m1, view=c("X", "Y"), el.pos=electrodes)
##D 
##D # some formatting options:
##D plot_topo(m1, view=c("X", "Y"), el.pos=electrodes,
##D     main="Topo plot", zlim=c(-.5,.5), 
##D     pch=15, col='red', color='terrain')
##D 
##D # plotting more than one panel only works if 
##D # each figure region is a square:
##D dev.new(width=12, height=4) 
##D par(mfrow=c(1,3))
##D 
##D for(i in c(100, 200, 300)){
##D     # make sure to keep zlim constant:
##D    plot_topo(m1, view=c('X', 'Y'), zlim=c(-.5, .5), 
##D     cond=list(Time=i), el.pos=electrodes,
##D     main=i)
##D }
##D 
##D dev.new(width=12, height=4) 
##D par(mfrow=c(1,3), cex=1.1)
##D # The three different functions for plotting:
##D plot_topo(m1, view=c('X', 'Y'), zlim=c(-.5, .5), 
##D     el.pos=electrodes,
##D     fun='fvisgam', main='fvisgam', 
##D     cond=list(Time=200), rm.ranef=TRUE)
##D plot_topo(m1, view=c('X', 'Y'), zlim=c(-.5, .5), 
##D     el.pos=electrodes, select=1,
##D     fun='pvisgam', main='pvisgam', 
##D     cond=list(Time=200))
##D plot_topo(m1, view=c('X', 'Y'), zlim=c(-.5, .5), 
##D     el.pos=electrodes, comp=list(Time=c(300,100)),
##D     fun='plot_diff2', main='plot_diff2', 
##D     plotCI=TRUE)
##D 
##D # Add labels:
##D plot_topo(m1, view=c('X', 'Y'), zlim=c(-.5, .5), 
##D     fun='fvisgam', main='', 
##D     cond=list(Time=200), add.color.legend=FALSE)
##D text(electrodes[['X']], electrodes[['Y']], 
##D     labels=electrodes[['Electrode']], cex=.75, 
##D     xpd=TRUE)
## End(Not run)



