library(spBayes)


### Name: FBC07.dat
### Title: Synthetic multivariate data with spatial and non-spatial
###   variance structures
### Aliases: FBC07.dat
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D data(FBC07.dat)
##D library(geoR)
##D 
##D max <- 40
##D bins <- 20
##D pts <- 1:150
##D 
##D vario.1 <- variog(coords=FBC07.dat[pts,1:2], data=FBC07.dat[pts,3],
##D           uvec=(seq(0, max, length=bins)))
##D 
##D vario.2 <- variog(coords=FBC07.dat[pts,1:2], data=FBC07.dat[pts,4],
##D                   uvec=(seq(0,max, length=bins)))
##D 
##D vario.fit.1 <-variofit(vario.1, ini.cov.pars=c(5.0, 1.0),
##D                        cov.model="exponential",
##D                        minimisation.function="nls",
##D                        weights="equal")
##D 
##D vario.fit.2 <-variofit(vario.2, ini.cov.pars=c(5.0, 10.0),
##D                        cov.model="exponential",
##D                        minimisation.function="nls",
##D                        weights="equal")
##D 
##D par(mfrow=c(1,2))
##D 
##D plot(vario.1$u, vario.1$v, axes=FALSE, type = "n",
##D      ylim=c(0,15), xlab="Distance", ylab="Semivariance")
##D points(vario.1$u, vario.1$v, pch=19, cex=0.5)
##D axis(1, seq(0,max,10))
##D axis(2, seq(0,15,5))
##D abline(h=vario.fit.1$nugget)
##D abline(h=vario.fit.1$cov.pars[1]+vario.fit.1$nugget)
##D abline(v=3/(1/vario.fit.1$cov.pars[2]))
##D lines(vario.fit.1)
##D 
##D plot(vario.2$u, vario.2$v, axes=FALSE, type = "n",
##D      ylim=c(0,15), xlab="Distance", ylab="")
##D points(vario.2$u, vario.2$v, pch=19, cex=0.5)
##D axis(1, seq(0,max,10))
##D abline(h=vario.fit.2$nugget)
##D abline(h=vario.fit.2$cov.pars[1]+vario.fit.2$nugget)
##D abline(v=3/(1/vario.fit.2$cov.pars[2]))
##D lines(vario.fit.2)
## End(Not run)



