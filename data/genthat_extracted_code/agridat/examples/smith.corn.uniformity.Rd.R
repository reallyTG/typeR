library(agridat)


### Name: smith.corn.uniformity
### Title: Uniformity trial of corn, 3 years on same ground
### Aliases: smith.corn.uniformity

### ** Examples

## Not run: 
##D 
##D data(smith.corn.uniformity)
##D dat <- smith.corn.uniformity
##D 
##D   dat = transform(dat, year=factor(year))
##D   require(desplot)
##D   desplot(yield~col*row|year, dat,
##D           layout=c(2,2), aspect=1,
##D           main="smith.corn.uniformity: yield across years 1895-1987")
##D 
##D   ## # Outliers are obvious
##D   ## require(lattice)
##D   ## xyplot(yield~row|factor(col), dat, groups=year,
##D   ##        auto.key=list(columns=3), main="smith.corn.uniformity")
##D 
##D   require(rgl)
##D   # A few odd pairs of outliers in column 6
##D   # black/gray dots very close to each other
##D   plot3d(dat$col, dat$row, dat$yield, col=dat$year,
##D          xlab="col",ylab="row",zlab="yield")
##D   rgl.close()
##D   
## End(Not run)



