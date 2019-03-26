library(TAM)


### Name: plot.tam
### Title: Plot Function for Unidimensional Item Response Models
### Aliases: plot.tam plot.tam.mml plot.tam.jml
### Keywords: plot

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dichotomous data data.sim.rasch
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D mod <- TAM::tam.mml(data.sim.rasch)
##D # expected response curves
##D plot(mod, items=1:5, export=FALSE)
##D # item response curves
##D plot(mod, items=1:5, type="items", export=FALSE)
##D # plot with graphics package
##D plot(mod, items=1:5, type="items", export=FALSE, ask=TRUE, package="graphics")
##D 
##D #############################################################################
##D # EXAMPLE 2: Polytomous data
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students[, c("sc3","sc4", "mj1", "mj2" )]
##D dat <- na.omit(dat)
##D dat[ dat[,1]==3, 1 ] <- 2   # modify data
##D dat[ 1:20, 2 ] <- 4
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml( dat )
##D # plot item response curves and expected response curves
##D plot(mod1, type="items", export=FALSE)
##D plot(mod1, type="expected", export=FALSE )
## End(Not run)



