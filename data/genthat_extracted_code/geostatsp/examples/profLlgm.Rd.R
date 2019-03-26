library(geostatsp)


### Name: profLlgm
### Title: Joint confidence regions
### Aliases: profLlgm informationLgm

### ** Examples


# this example is time consuming
# the following 'if' statement ensures the CRAN
# computer doesn't run it
if(interactive() | Sys.info()['user'] =='patrick') {

library('geostatsp')
data('swissRain')

swissFit = lgm(data=swissRain, formula=rain~ CHE_alt,
		grid=10, covariates=swissAltitude,
		shape=1,  fixShape=TRUE, 
		boxcox=0.5, fixBoxcox=TRUE, 
		aniso=TRUE,reml=TRUE,
		param=c(anisoAngleDegrees=37,anisoRatio=7.5,
		range=50000))


x=profLlgm(swissFit,
		anisoAngleDegrees=seq(30, 43 , len=4)
)


plot(x[[1]],x[[2]], xlab=names(x)[1],
		ylab='log L',
		ylim=c(min(x[[2]]),x$maxLogL),
		type='n')
abline(h=x$breaks[-1],
		col=x$col,
		lwd=1.5)
axis(2,at=x$breaks,labels=x$prob,line=-1.2,
	tick=FALSE,
		las=1,padj=1.2,hadj=0)
abline(v=x$ciLong$par,
		lty=2,
		col=x$col[as.character(x$ciLong$prob)])
lines(x[[1]],x[[2]], col='black')



}




