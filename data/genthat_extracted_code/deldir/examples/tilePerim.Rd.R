library(deldir)


### Name: tilePerim
### Title: Calculate tile perimeters.
### Aliases: tilePerim
### Keywords: spatial

### ** Examples

    x <- runif(20)
    y <- runif(20)
    z <- deldir(x,y,rw=c(0,1,0,1))
    w <- tile.list(z)
    p1 <- tilePerim(w)
    p0 <- tilePerim(w,inclbdry=FALSE)
    p1$totalPerim - p0$totalPerim # Get 4 = the perimeter of rw.
    ss <- apply(as.matrix(z$dirsgs[,1:4]),1,
                function(x){(x[1]-x[3])^2 + (x[2]-x[4])^2})
    2*sum(sqrt(ss)) - p0$totalPerim # Get 0; in tilePerim() each interior
                                    # edge is counted twice.



