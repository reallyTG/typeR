library(inlmisc)


### Name: SetPolygons
### Title: Overlay Multi-Polygon Objects
### Aliases: SetPolygons
### Keywords: utilities

### ** Examples

m1a <- rbind(c(17.5, 55.1), c(24.7, 55.0), c(22.6, 61.1),
             c(16.5, 59.7), c(17.5, 55.1))
m1b <- m1a
m1b[, 1] <- m1b[, 1] + 11
p1 <- sp::SpatialPolygons(list(sp::Polygons(list(sp::Polygon(m1a, FALSE),
                                                 sp::Polygon(m1b, FALSE)), 1)))
sp::plot(p1, col = "blue")

m2a <- rbind(c(19.6, 60.0), c(35.7, 58.8), c(28.2, 64.4), c(19.6, 60.0))
m2b <- rbind(c(20.6, 56.2), c(30.9, 53.8), c(27.3, 51.4), c(20.6, 56.2))
p2 <- sp::SpatialPolygons(list(sp::Polygons(list(sp::Polygon(m2a, FALSE),
                                                 sp::Polygon(m2b, FALSE)), 2)))
sp::plot(p2, col = "red", add = TRUE)

p <- SetPolygons(p1, p2, "gIntersection")
sp::plot(p, col = "green", add = TRUE)

p <- SetPolygons(p2, p1, "gDifference")
sp::plot(p, col = "purple", add = TRUE)




