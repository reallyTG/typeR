library(widals)


### Name: distance
### Title: Spacial Distance
### Aliases: distance
### Keywords: ~kwd1 ~kwd2

### ** Examples


locs1 <- cbind( c(-1, -1, 1, 1), c(-1, 1, -1, 1) )
locs2 <- cbind( c(0), c(0) )

distance(locs1, locs2)


locs1 <- cbind( c(32, 0), c(-114, -114) )
locs2 <- cbind( c(0), c(0) )

distance(locs1, locs2, TRUE)


####### separation of one deg long at 88 degs lat (near North-Pole) is (appx)
locs1 <- cbind( c(88), c(-114) )
locs2 <- cbind( c(88), c(-115) )
distance(locs1, locs2, TRUE)

####### separation of one deg long at 0 degs lat (Equator) is (appx)
locs1 <- cbind( c(0), c(-114) )
locs2 <- cbind( c(0), c(-115) )
distance(locs1, locs2, TRUE)





## The function is currently defined as
function (locs1, locs2, geodesic = FALSE) 
{
#    dyn.load("~/Files/Creations/C/distance.so")
    n1 <- nrow(locs1)
    n2 <- nrow(locs2)
    d.out <- rep(0, n1 * n2)
    if (geodesic) {
        D.Mx <- .C("distance_geodesic_AB", as.double(locs1[, 
            1] * pi/180), as.double(locs1[, 2] * pi/180), as.double(locs2[, 
            1] * pi/180), as.double(locs2[, 2] * pi/180), as.double(d.out), 
            as.integer(n1), as.integer(n2))[[5]]
    }
    else {
        D.Mx <- .C("distance_AB", as.double(locs1[, 1]), as.double(locs1[, 
            2]), as.double(locs2[, 1]), as.double(locs2[, 2]), 
            as.double(d.out), as.integer(n1), as.integer(n2))[[5]]
    }
    D.out <- matrix(D.Mx, n1, n2)
    return(D.out)
  }



