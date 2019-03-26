library(rgeos)


### Name: RGEOS Polygon Hole Comment Functions
### Title: RGEOS Polygon Hole Comment Functions
### Aliases: createSPComment createPolygonsComment get_do_poly_check
###   set_do_poly_check
### Keywords: spatial

### ** Examples

	
library(sp)
p1 <- Polygon(cbind(x=c(0, 0, 10, 10, 0), y=c(0, 10, 10, 0, 0)), hole=FALSE) # I
p2 <- Polygon(cbind(x=c(3, 3, 7, 7, 3), y=c(3, 7, 7, 3, 3)), hole=TRUE) # H
p8 <- Polygon(cbind(x=c(1, 1, 2, 2, 1), y=c(1, 2, 2, 1, 1)), hole=TRUE) # H
p9 <- Polygon(cbind(x=c(1, 1, 2, 2, 1), y=c(5, 6, 6, 5, 5)), hole=TRUE) # H
p3 <- Polygon(cbind(x=c(20, 20, 30, 30, 20), y=c(20, 30, 30, 20, 20)),
 hole=FALSE) # I
p4 <- Polygon(cbind(x=c(21, 21, 29, 29, 21), y=c(21, 29, 29, 21, 21)),
 hole=TRUE) # H
p5 <- Polygon(cbind(x=c(22, 22, 28, 28, 22), y=c(22, 28, 28, 22, 22)),
 hole=FALSE) # I
p6 <- Polygon(cbind(x=c(23, 23, 27, 27, 23), y=c(23, 27, 27, 23, 23)),
 hole=TRUE) # H
p7 <- Polygon(cbind(x=c(13, 13, 17, 17, 13), y=c(13, 17, 17, 13, 13)),
 hole=FALSE) # I
p10 <- Polygon(cbind(x=c(24, 24, 26, 26, 24), y=c(24, 26, 26, 24, 24)),
 hole=FALSE) # I
p11 <- Polygon(cbind(x=c(24.25, 24.25, 25.75, 25.75, 24.25),
 y=c(24.25, 25.75, 25.75, 24.25, 24.25)), hole=TRUE) # H
p12 <- Polygon(cbind(x=c(24.5, 24.5, 25.5, 25.5, 24.5),
 y=c(24.5, 25.5, 25.5, 24.5, 24.5)), hole=FALSE) # I
p13 <- Polygon(cbind(x=c(24.75, 24.75, 25.25, 25.25, 24.75),
 y=c(24.75, 25.25, 25.25, 24.75, 24.75)), hole=TRUE) # H
	
lp <- list(p1, p2, p13, p7, p6, p5, p4, p3, p8, p11, p12, p9, p10)
#           1   2    3   4   5   6   7   8   9   10   11  12   13
#           0   1   11   0   6   0   8   0   1   13    0   1    0
#           I   H    H   I   H   I   H   I   H    H    I   H    I
pls <- Polygons(lp, ID="1")
comment(pls)
	
comment(pls) = createPolygonsComment(pls)
comment(pls)
	
	
plot(SpatialPolygons(list(pls)), col="magenta", pbg="cyan")
 title(xlab="Hole slot values before checking")
## Not run: 
##D # running this illustration may be time-consuming
##D if (require(maptools)) {
##D data(wrld_simpl)
##D usa <- wrld_simpl[wrld_simpl$ISO3=="USA",]
##D lapply(slot(usa, "polygons"), comment)
##D gIsValid(usa, reason=TRUE)
##D comment(slot(usa, "polygons")[[1]]) <- NULL
##D lapply(slot(usa, "polygons"), comment)
##D gIsValid(usa)
##D any(c(sapply(slot(usa, "polygons"),
##D  function(x) sapply(slot(x, "Polygons"), slot, "hole"))))
##D lapply(slot(createSPComment(usa), "polygons"), comment)
##D usa1 <- usa
##D Pls <- slot(usa1, "polygons")
##D pls <- slot(Pls[[1]], "Polygons")
##D pls1 <- lapply(pls, function(p) {slot(p, "hole") <- FALSE; return(p)})
##D slot(Pls[[1]], "Polygons") <- pls1
##D slot(usa1, "polygons") <- Pls
##D any(c(sapply(slot(usa1, "polygons"),
##D  function(x) sapply(slot(x, "Polygons"), slot, "hole"))))
##D lapply(slot(createSPComment(usa1), "polygons"), comment)
##D gIsValid(usa1, reason=TRUE)
##D Pls <- slot(usa1, "polygons")
##D Pls1 <- lapply(Pls, checkPolygonsHoles)
##D slot(usa1, "polygons") <- Pls1
##D lapply(slot(usa1, "polygons"), comment)
##D gIsValid(usa1, reason=TRUE)
##D }
## End(Not run)



