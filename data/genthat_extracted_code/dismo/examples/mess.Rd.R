library(dismo)


### Name: mess
### Title: Multivariate environmental similarity surfaces (MESS)
### Aliases: mess

### ** Examples


set.seed(9)
r <- raster(ncol=10, nrow=10)
r1 <- setValues(r, (1:ncell(r))/10 + rnorm(ncell(r)))
r2 <- setValues(r, (1:ncell(r))/10 + rnorm(ncell(r)))
r3 <- setValues(r, (1:ncell(r))/10 + rnorm(ncell(r)))
s <- stack(r1,r2,r3)
names(s) <- c('a', 'b', 'c')
xy <- cbind(rep(c(10,30,50), 3), rep(c(10,30,50), each=3))
refpt <- extract(s, xy)

ms <- mess(s, refpt, full=TRUE)
plot(ms)


## Not run: 
##D filename <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D bradypus <- read.table(filename, header=TRUE, sep=',')
##D bradypus <- bradypus[,2:3]
##D files <- list.files(path=paste(system.file(package="dismo"),'/ex', sep=''), 
##D    pattern='grd', full.names=TRUE )
##D predictors <- stack(files)
##D predictors <- dropLayer(x=predictors,i=9)
##D reference_points <- extract(predictors, bradypus)
##D mss <- mess(x=predictors, v=reference_points, full=TRUE)
##D plot(mss)
## End(Not run)




