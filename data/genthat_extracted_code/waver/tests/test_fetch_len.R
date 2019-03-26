library(waver)
context("Fetch length")

# Set up Spatial objects
longlat <- "+proj=longlat +datum=WGS84"
aeqd1 <-"+proj=aeqd +lon_0=0 +lat_0=0"
aeqd2 <- "+proj=aeqd +lon_0=180 +lat_0=0"

# p1 at (0,0)
p1 <- SpatialPoints(matrix(c(0, 0), ncol = 2), proj4string = CRS(longlat))
land1 <- SpatialPolygons(list(Polygons(list(
    waver:::poly_rect(-0.2, 0.25, 0.3, 0.5)), ID = 1)),
    proj4string = CRS(longlat))
p1_df <- SpatialPointsDataFrame(p1, data.frame(v1 = 2, v2 = "a"))
p1_prj <- spTransform(p1, CRS(aeqd1))
land1_prj <- spTransform(land1, CRS(aeqd1))

# p2 near international date line
p2 <- SpatialPoints(matrix(c(-179.75, 0), ncol = 2), proj4string = CRS(longlat))
land2 <- SpatialPolygons(list(
    Polygons(list(waver:::poly_rect(-179.95, 0.25, -179.45, 0.5)), ID = 2),
    Polygons(list(waver:::poly_rect(179.7, -0.4, 179.95, 0.2)), ID = 3)),
    proj4string = CRS(longlat))
p2_prj <- spTransform(p2, CRS(aeqd2))
land2_prj <- spTransform(land2, CRS(aeqd2))

# p3 on land1
p3 <- SpatialPoints(matrix(c(0, 0.4), ncol = 2), proj4string = CRS(longlat))
p3_prj <- spTransform(p3, CRS(aeqd1))
p13 <- rbind(p1, p3)
p13_prj <- spTransform(p13, CRS(aeqd1))

# Multiple points
pts <- rbind(p1, p2, p3)
lands <- rbind(land1, land2)
pts_df <- SpatialPointsDataFrame(pts,
                 data.frame(v1 = c(2, 5, 6), v2 = c("a", "e", "h")))
lands_df <- SpatialPolygonsDataFrame(lands, data.frame(v3 = c("s", "t", "u")))

# Fetch parameters
bearings <- c(0, 45, 225, 315)
spread <- c(-10, 0, 10)
dmax <- 50000

# Expected results
tol <- 1E-4 # relative tolerance level
fexp1 <- setNames(c(27644, 39094, 50000, 50000), bearings)
fexp1spr <- setNames(c(27926, 40937, 50000, 44610), bearings)
fexp2 <- setNames(c(27644, 39094, 47228, 50000), bearings)
fexp2spr <- setNames(c(27926, 40937, 46005, 44610), bearings)
fexp3 <- setNames(rep(NA, 4), bearings)


test_that("fetch_len correct for single point", {
    expect_equal(fetch_len(p1, bearings, land1, dmax), fexp1, tolerance = tol)
    expect_equal(fetch_len(p1, bearings, land1, dmax, spread),
                 fexp1spr, tolerance = tol)
    expect_equal(fetch_len(p1, bearings, as(land1, "SpatialLines"), dmax),
                 fexp1, tolerance = tol)
    expect_equal(fetch_len(p1_prj, bearings, land1_prj, dmax, projected = TRUE),
                 fexp1, tolerance = tol)
    expect_equal(fetch_len(p1_prj, bearings, land1_prj, dmax, spread,
                           projected = TRUE), fexp1spr, tolerance = tol)
    expect_equal(fetch_len(p1_prj, bearings, as(land1_prj, "SpatialLines"),
                           dmax, projected = TRUE), fexp1, tolerance = tol)
})


test_that("fetch_len correct near international date line", {
    expect_equal(fetch_len(p2, bearings, land2, dmax), fexp2, tolerance = tol)
    expect_equal(fetch_len(p2, bearings, land2, dmax, spread),
                 fexp2spr, tolerance = tol)
    expect_equal(fetch_len(p2_prj, bearings, land2_prj, dmax, projected = TRUE),
                 fexp2, tolerance = tol)
    expect_equal(fetch_len(p2_prj, bearings, land2_prj, dmax, spread,
                           projected = TRUE), fexp2spr, tolerance = tol)
})


test_that("fetch_len for point on land returns NA and issues warning", {
    expect_warning(fetch_len(p3, bearings, land1, dmax), "on land")
    expect_warning(fetch_len(p3_prj, bearings, land1_prj, dmax,
                             projected = TRUE), "on land")
    expect_equal(suppressWarnings(fetch_len(p3, bearings, land1, dmax)), fexp3)
    expect_equal(suppressWarnings(fetch_len(p3_prj, bearings, land1_prj, dmax,
                                            projected = TRUE)), fexp3)
})


test_that("fetch_len_multi matches fetch_len results", {
    expect_equal(suppressWarnings(fetch_len_multi(pts, bearings, lands, dmax)),
                 `rownames<-`(rbind(fexp1, fexp2, fexp3), NULL), tolerance = tol)
    expect_equal(suppressWarnings(fetch_len_multi(pts, bearings, lands, dmax,
                                                  method = "clip")),
                 `rownames<-`(rbind(fexp1, fexp2, fexp3), NULL), tolerance = tol)
    expect_equal(
        suppressWarnings(fetch_len_multi(pts, bearings, lands, dmax, spread)),
        `rownames<-`(rbind(fexp1spr, fexp2spr, fexp3), NULL), tolerance = tol)
    expect_equal(
        suppressWarnings(fetch_len_multi(p13_prj, bearings, land1_prj, dmax,
                                         projected = TRUE)),
        `rownames<-`(rbind(fexp1, fexp3), NULL), tolerance = tol)
})


test_that("fetch_len works with Spatial*DataFrame", {
    expect_equal(fetch_len(p1_df, bearings, lands_df, dmax),
                 fexp1, tolerance = tol)
    expect_equal(
        suppressWarnings(fetch_len_multi(pts_df, bearings, lands_df, dmax)),
        `rownames<-`(rbind(fexp1, fexp2, fexp3), NULL), tolerance = tol)
})


test_that("fetch_len fails on bad inputs", {
    expect_error(fetch_len(0, bearings, land1, dmax), "SpatialPoints")
    expect_error(fetch_len(pts, bearings, land1, dmax), "single point")
    expect_error(fetch_len(p1, bearings, p1, dmax), "SpatialPolygons")
    expect_error(fetch_len(p1, bearings, land1_prj, dmax, projected = TRUE),
                 "cannot use long/lat")
    expect_error(fetch_len(p1_prj, bearings, land1, dmax, projected = TRUE),
                 "cannot use long/lat")
    expect_error(fetch_len(p1_prj, bearings, land1, dmax), "unprojected")
    expect_error(fetch_len(p1, bearings, land1_prj, dmax), "unprojected")
    expect_error(fetch_len(p1_prj, bearings, spTransform(land1, CRS(aeqd2)),
                           dmax, projected = TRUE), "projections")
    expect_error(fetch_len(p1_prj, bearings, land1, dmax), "unprojected")
    expect_error(fetch_len(p1, "a", land1, dmax), "bearings")
    expect_error(fetch_len(p1, bearings, land1, dmax, "a"), "spread")
    expect_error(fetch_len(p1, bearings, land1, 0), "dmax")
    expect_error(fetch_len(p1, bearings, land1, c(1,2)), "dmax")
})
