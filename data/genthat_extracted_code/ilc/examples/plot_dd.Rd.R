library(ilc)


### Name: plot_dd
### Title: Miscellaneous plotting functions for 'demogdata' type mortality
###   data. Versatile plotting tool with an optional legend.
### Aliases: plot_dd
### Keywords: methods

### ** Examples

# plot log mortality rates with repositioned legend 
plot_dd(dd.cmi.pens, xlim=c(40, 110), lpar=list(x.intersp=-0.2, y.intersp=0.9, cex=0.85))
# plot (untransformed) mortality rates with repositioned legend
plot_dd(dd.cmi.pens, age=60:95, lpar=list(x.intersp=-0.2, y.intersp=0.9, cex=0.85), transf=FALSE)
# plot a small subset of log mortality rates (calendar years: 1985 - 1995)
#      and add a line with the overall mean rates
plot_dd(dd.cmi.pens, lpos=list(x=0.85,y=0.55), year=1985:1995, 
		lpar=list(x.intersp=-0.1, y.intersp=0.95, cex=0.9))
lines(mean(dd.cmi.pens),lwd=2, lty=3, col='red')
# legend(coord('LC'), legend='mean rate', lwd=2, lty=3, col='red', text.col='red')
# plot number of (extracted) deaths:
tmp.d <- extract.deaths(dd.cmi.pens, ages=55:100, y=1995:2003)
plot_dd(tmp.d, transf=FALSE, lty=1:5, ylab='Number of Deaths', 
		main=paste(tmp.d$lab, ": male (1995-2003)", sep='')) 



