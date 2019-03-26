library(DSpat)


### Name: sample.points
### Title: Sample points within each transect and filter with specified
###   detection function
### Aliases: sample.points hndetfct

### ** Examples

study.area=owin(xrange=c(0,100),yrange=c(0,100))
hab.range=30
probs=c(1/3,2/3)
covariates = simCovariates(hab.range, probs)
xlines=create.lines(study.area,nlines=10,width=5,angle=45)
ls=lines_to_strips(xlines,study.area)
plot(ls$lines,lty=2)
plot(owin(poly=ls$transects),add=TRUE)
xpp=simPts(covariates=covariates,int.formula=~factor(habitat),int.par=c(0,1,2),EN=1000)
obs=sample.points(transects=ls$transects,lines=xlines,points.ppp=xpp,
                    hndetfct,c(1),covariates=covariates)
plot(ppp(x=obs$x,y=obs$y,window=study.area),add=TRUE,pch=20)



