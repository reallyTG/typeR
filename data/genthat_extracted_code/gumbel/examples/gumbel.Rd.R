library(gumbel)


### Name: Gumbel
### Title: The Gumbel Hougaard Copula
### Aliases: gumbel dgumbel pgumbel rgumbel phigumbel invphigumbel
###   gumbel.MBE gumbel.EML gumbel.IFM gumbel.CML
### Keywords: distribution

### ** Examples

	#dim=2
	u<-seq(0,1, .1)
	v<-u
	#classic parametrization
	#independance case (alpha=1)
	dgumbel(u,v,1)
	pgumbel(u,v,1)
	#another parametrization
	dgumbel(cbind(u,v), alpha=1)
	pgumbel(cbind(u,v), alpha=1)

	#dim=3 - equivalent parametrization
	x <- cbind(u,u,u)
	y <- array(u, c(1,11,3))
	pgumbel(x, alpha=2, dim=3)
	pgumbel(y, alpha=2, dim=3)
	dgumbel(x, alpha=2, dim=3)
	dgumbel(y, alpha=2, dim=3)

	#dim=4
	x <- cbind(x,u)
	pgumbel(x, alpha=3, dim=4)
	y <- array(u, c(2,1,11,4))
	pgumbel(y, alpha=3, dim=4)
	
	
	#independence case
	rand <- t(rgumbel(200,1))
	plot(rand[1,], rand[2,], col="green", main="Gumbel copula")
	
	#positive dependence
	rand <- t(rgumbel(200,2))
	plot(rand[1,], rand[2,], col="red", main="Gumbel copula")
	
	#comparison of random generation algorithms
	nbsimu <- 10000
	#Marshall Olkin algorithm
	system.time(rgumbel(nbsimu, 2, dim=2, method=1))[3]
	#K algortihm
	system.time(rgumbel(nbsimu, 2, dim=2, method=2))[3]
	
	#pseudo animation
	## Not run: 
##D 	anim <-function(n, max=50)
##D 	{
##D 	for(i in seq(1,max,length.out=n)) 
##D 	{
##D 		u <- t(rgumbel(10000, i, method=2))
##D 		plot(u[1,], u[2,], col="green", main="Gumbel copula",
##D             xlim=c(0,1), ylim=c(0,1), pch=".")
##D 		cat()
##D 	}	
##D 	}
##D 	anim(20, 20)
##D 	
## End(Not run)
	
	#3D plots

	#plot the density
 	x <- seq(.05, .95, length = 30)
	y <- x
	z <- outer(x, y, dgumbel, alpha=2)
		
	persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 100, shade = 0.25, ticktype = "detailed",
      xlab = "x", ylab = "y", zlab = "density")
	
	#with wonderful colors
	#code of P. Soutiras
	zlim <- c(0, max(z))
	ncol <- 100
	nrz <- nrow(z)
	ncz <- ncol(z)
	jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", 
	"cyan", "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")) 
	couleurs <- tail(jet.colors(1.2*ncol),ncol)
	fcol <- couleurs[trunc(z/zlim[2]*(ncol-1))+1]
	dim(fcol) <- c(nrz,ncz)
	fcol <- fcol[-nrz,-ncz]
	persp(x, y, z, col=fcol, zlim=zlim, theta=30, phi=30, ticktype = "detailed",
        box = TRUE, 	xlab = "x", ylab = "y", zlab = "density")
	

	#plot the distribution function
	z <- outer(x, y, pgumbel, alpha=2)
	persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
        ltheta = 100, shade = 0.25, ticktype = "detailed",
        xlab = "u", ylab = "v", zlab = "cdf")
	
	

	#parameter estimation
	#true value : lambdaX=lambdaY=1, alpha=2
	simu <- qexp(rgumbel(200, 2))
	gumbel.MBE(simu[,1], simu[,2])
	gumbel.IFM(simu[,1], simu[,2])
	gumbel.EML(simu[,1], simu[,2])
	gumbel.CML(simu[,1], simu[,2])

	#true value : lambdaX=lambdaY=1, alphaX=alphaY=2, alpha=3
	simu <- qgamma(rgumbel(200, 3), 2, 1)
	gumbel.MBE(simu[,1], simu[,2], "gamma")
	gumbel.IFM(simu[,1], simu[,2], "gamma")
	gumbel.EML(simu[,1], simu[,2], "gamma")
	gumbel.CML(simu[,1], simu[,2])
		

		



