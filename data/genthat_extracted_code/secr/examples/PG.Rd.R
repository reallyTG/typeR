library(secr)


### Name: PG
### Title: Telemetry Fixes in Polygons
### Aliases: PG
### Keywords: manip

### ** Examples


## Not run: 
##D setwd('d:/density communication/combining telemetry and secr/possums')
##D CvilleCH <- read.capthist('CVILLE summer captures 4occ.txt',
##D                           'CVILLE detectors summer 4occ.txt',
##D                           detector = 'single')
##D CvilleGPS <- read.telemetry('CVILLE GPS Combined 4occ.txt')
##D CvilleGPSnew <- read.telemetry('CVILLE summer GPS New occasions.txt')
##D CvilleBoth <- addTelemetry(CvilleCH, CvilleGPSnew)
##D plot(CvilleBoth, border = 400)
##D PG(CvilleBoth, buffer = 100, convex = TRUE, plt = TRUE, add = T, col = 'red')
##D 
##D ###################################################################
##D ## this code computes an area-adjusted density estimate
##D ## cf Grant and Doherty 2007
##D PGD <- function (CH, estimator = 'h2', ...) {
##D     pg <- PG(CH, ...)
##D     PGbar <- mean(pg)
##D     N <- closedN(CH, estimator)
##D     A <- polyarea(buffer.contour(traps(CH), ...)[[1]])
##D     Dhat <- N$Nhat / A * PGbar
##D     varDhat <- (N$Nhat^2 * var(pg) + PGbar^2 * N$seNhat^2) / A^2 
##D     c(Dhat = Dhat, seDhat = sqrt(varDhat))
##D }
##D plot(traps(CvilleBoth), border = 400)
##D PGD(CvilleBoth, buffer = 0, convex = TRUE, plt = TRUE, add = TRUE)
##D PGD(CvilleBoth, est='null', buffer = 0, convex = TRUE, plt = FALSE)
##D 
##D ###################################################################
##D ## this code generates a PG summary for telemetry records randomly
##D ## translated and rotated, keeping the centres within a habitat mask
##D 
##D randomPG <- function(CH, poly = NULL, mask, reorient = TRUE, nrepl = 1,
##D                      seed = 12345, ...) {
##D     moveone <- function(xy, newcentre) {
##D         xy <- sweep(xy,2,apply(xy,2,mean))
##D         if (reorient)  ## random rotation about centre
##D             xy <- rotate(xy, runif(1)*360)
##D         sweep(xy,2,unlist(newcentre), "+")
##D     }
##D     onerepl <- function(r) {   ## r is dummy for replicate
##D         centres <- sim.popn(D = D, core = mask, model2D = "IHP",
##D                             Ndist = "fixed")
##D         xyl <- mapply(moveone, xyl, split(centres, rownames(centres)))
##D         attr(CH, 'xylist') <- xyl  ## substitute random placement
##D         PG(CH = CH , poly = poly, plt = FALSE, ...)
##D     }
##D     set.seed(seed)
##D     require(sp)
##D     if (is.null(poly)) {
##D         poly <- buffer.contour (traps(CH), ...)
##D         srl <- lapply(poly, function(x) Polygon(as.matrix(x)))
##D         tmp <- Polygons(srl,1)
##D         poly <- SpatialPolygons(list(tmp))
##D         poly <- SpatialPolygonsDataFrame(poly, data = data.frame(ID =
##D                                                names(poly)))
##D     }
##D     xyl <- telemetryxy(CH)
##D     maskarea <- nrow(mask) * attr(mask, 'area')
##D     D <- length(xyl) / maskarea
##D     sapply(1:nrepl, onerepl)
##D }
##D 
##D mask <- make.mask (traps(CvilleBoth), buffer = 400, type = "trapbuffer")
##D require(sp)
##D pg <- randomPG (CvilleBoth, mask = mask, buffer = 100, convex = TRUE,
##D     nrepl = 20)
##D apply(pg, 1, mean)
##D ###################################################################
##D 
## End(Not run)



