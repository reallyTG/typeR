library(gjam)


### Name: gjamPoints2Grid
### Title: Incidence point pattern to grid counts
### Aliases: gjamPoints2Grid

### ** Examples

## Not run: 
##D ## random data
##D n  <- 100
##D s  <- sample( letters[1:3], n, replace = TRUE)
##D xy <- cbind( rnorm(n,0,.2), rnorm(n,10,2) )
##D 
##D nx <- ny <- 5                                    # uniform 5 X 5 lattice
##D f  <- gjamPoints2Grid(s, xy, nxy = c(nx, ny))
##D plot(f$predGrid[,1], f$predGrid[,2], cex=.1, xlim=c(-1,1), ylim=c(0,20),
##D      xlab = 'x', ylab = 'y')
##D text(f$predGrid[,1], f$predGrid[,2], rowSums(f$gridBySpec))
##D 
##D dx <- .2                                          # uniform density
##D dy <- 1.5
##D g  <- gjamPoints2Grid(s, xy, dxy = c(dx, dy))
##D text(g$predGrid[,1], g$predGrid[,2], rowSums(g$gridBySpec), col='brown')
##D 
##D p  <- cbind( runif(30, -1, 1), runif(30, 0, 20) ) # irregular lattice
##D h  <- gjamPoints2Grid(s, xy, predGrid = p)
##D text(h$predGrid[,1], h$predGrid[,2], rowSums(h$gridBySpec), col='blue')
## End(Not run)



