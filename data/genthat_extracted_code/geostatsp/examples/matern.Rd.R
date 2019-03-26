library(geostatsp)


### Name: matern
### Title: Evaluate the Matern correlation function
### Aliases: matern matern.default matern.dist matern.Raster
###   matern.SpatialPoints matern.SpatialPointsDataFrame fillParam

### ** Examples

param=c(shape=1,range=1,variance=1)
u=seq(0,4,len=20)
	uscale = sqrt(8*param['shape'])* u / param['range']
theMaterns = cbind(
	dist=u, 
	manual=	param['variance']*
			( 1/(gamma(param['shape']) * 2^(param['shape']-1)  ) ) * 
			uscale^param['shape'] * besselK( uscale , param['shape']),
	geostatsp=matern(u, param=param)
)
head(theMaterns)
matplot(theMaterns[,'dist'], 
	theMaterns[,c('manual','geostatsp')],
	col=c('red','blue'), type='l')
legend('topright', fill=c('red','blue'),
	legend=c('manual','geostatsp'))



# example with raster
myraster = raster(nrows=40,ncols=60,xmn=-3,xmx=3,ymn=-2,ymx=2)
param = c(range=2, shape=2,	anisoRatio=2, 
	anisoAngleDegrees=-25,variance=20)

# plot correlation of each cell with the origin
myMatern = matern(myraster, y=c(0,0), param=param)


plot(myMatern, main="anisortopic matern")


# correlation matrix for all cells with each other
myraster = raster(nrows=4,ncols=6,xmn=-3,xmx=3,ymn=-2,ymx=2)
myMatern = matern(myraster, param=c(range=2, shape=2))
dim(myMatern)

# plot the cell ID's
values(myraster) = seq(1, ncell(myraster))
mydf = as.data.frame(myraster, xy=TRUE)
plot(mydf$x, mydf$y, type='n', main="cell ID's")
text(mydf$x, mydf$y, mydf$layer)
# correlation between bottom-right cell and top right cell is
myMatern[6,24]

# example with points
mypoints = SpatialPoints(
	cbind(runif(8), runif(8))
	)
# variance matrix from points
m1=matern(mypoints, param=c(range=2,shape=1.4,variance=4,nugget=1))
# cholesky of variance from distances
c2=matern(dist(mypoints@coords), param=c(range=2,shape=1.4,variance=4,nugget=1),type='cholesky')

# check it's correct
quantile(as.vector(m1- tcrossprod(c2)))

# example with vector of distances
range=3
distVec = seq(0, 2*range, len=100)
shapeSeq = c(0.5, 1, 2,20)
theCov = NULL
for(D in shapeSeq) {
	theCov = cbind(theCov, matern(distVec, param=c(range=range, shape=D)))
}
matplot(distVec, theCov, type='l', lty=1, xlab='distance', ylab='correlation',
	main="matern correlations")
legend("right", fill=1:length(shapeSeq), legend=shapeSeq,title='shape')
# exponential

distVec2 = seq(0, max(distVec), len=20)
points(distVec2, exp(-2*(distVec2/range)),cex=1.5, pch=5)
# gaussian
points(distVec2, exp(-2*(distVec2/range)^2), col='blue',cex=1.5, pch=5)
legend("bottomleft", pch=5, col=c('black','blue'), legend=c('exp','gau'))

# comparing to geoR and RandomFields

if (requireNamespace("RandomFields", quietly = TRUE) &
requireNamespace("geoR", quietly = TRUE) 
) { 

covGeoR = covRandomFields = NULL

for(D in shapeSeq) {
	covGeoR = cbind(covGeoR, 
		geoR::matern(distVec, phi=range/sqrt(8*D), kappa=D))
	covRandomFields = cbind(covRandomFields,
		RandomFields::RFcov(x=distVec, 
		model=RandomFields::RMmatern(nu=D, var=1,
				scale=range/2) ))
}



matpoints(distVec, covGeoR, cex=0.5, pch=1)
matpoints(distVec, covRandomFields, cex=0.5, pch=2)

legend("topright", lty=c(1,NA,NA), pch=c(NA, 1, 2), 
	legend=c("geostatsp","geoR","RandomFields"))
}
 



