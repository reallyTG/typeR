library(spatstat)


### Name: lineardisc
### Title: Compute Disc of Given Radius in Linear Network
### Aliases: lineardisc countends
### Keywords: spatial

### ** Examples

    # letter 'A' 
    v <- ppp(x=(-2):2, y=3*c(0,1,2,1,0), c(-3,3), c(-1,7))
    edg <- cbind(1:4, 2:5)
    edg <- rbind(edg, c(2,4))
    letterA <- linnet(v, edges=edg)

   lineardisc(letterA, c(0,3), 1.6)
   # count the endpoints
   countends(letterA, c(0,3), 1.6)
   # cross-check (slower)
   en <- lineardisc(letterA, c(0,3), 1.6, plotit=FALSE)$endpoints
   npoints(en)



