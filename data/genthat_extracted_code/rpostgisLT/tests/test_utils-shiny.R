context("rposgisLT: shiny-steps")

schema <- "ibex_traj_materialized_bursts"
pgtraj <- "ibex_int_space"
view <- "step_geometry_shiny_ibex_int_space"
# attr(ibex_int_space, "proj4string") <- CRS("+init=epsg:3395")
# ltraj2pgtraj(conn_data, ibex_int_space, schema = "ibex_traj_materialized_bursts",
#              infolocs = TRUE, overwrite = TRUE)
# createShinyStepsView(conn_data, schema, pgtraj)
# createShinyBurstsView(conn_data, schema)

test_that("get time defaults in time window with time zone", {
    testthat::skip_on_cran()
    
    trajdef <-
        rpostgisLT:::getTrajDefaults(conn_data, schema, view = view,
                          pgtraj)
    
    # time zone handling is not bulletproof yet (v0.6.0)
    # expect_equal(trajdef$tstamp_start, as.POSIXct("2003-06-01", tz = "Europe/Paris"))
    # expect_equal(trajdef$tstamp_last, as.POSIXct("2003-06-14 14:25:39 CEST"))
    expect_equal(trajdef$increment, 4534)
    expect_equal(trajdef$time_zone, "Europe/Paris")
})

test_that("getInfolocsTable", {
    testthat::skip_on_cran()
    
    expect_silent(i <- rpostgisLT:::getInfolocsColumns(conn_data, schema, pgtraj))
    expect_equal(i, "pkey ,")
})


test_that("getLayers with POINT+MULTIPOINT", {
    testthat::skip_on_cran()
    
    expect_error(rpostgisLT:::getLayers(conn_data, c("example_data", "test_points_mixed")),
                 "layers_vector must be a list")
    expect_error(rpostgisLT:::getLayers(conn_data, list(c("example_data", "test_points_mixed"))),
                 "single type")
})

test_that("getLayers MULTIPOINT", {
    testthat::skip_on_cran()
    
    expect_error(l <-
                      rpostgisLT:::getLayers(conn_data, list(
                          c("example_data", "test_points_multi")
                      )),
                 "Leaflet 1.1.0 doesn't support MULTIPOINT geometries. Please cast to POINT.")
    expect_error(l <-
                      rpostgisLT:::getLayers(conn_data, list(
                          c("example_data", "test_points_multi_3395")
                      )),
                 "Leaflet 1.1.0 doesn't support MULTIPOINT geometries. Please cast to POINT.")
})

test_that("findGeoType handles missing layers", {
    testthat::skip_on_cran()
    
    expect_warning(rpostgisLT:::findGeoType(conn_data, list(c("my-imaginary", "layer"))),
                 "Couldn't find the table my-imaginary.layer in the database.")
})


test_that("findGeoType geometry types", {
    testthat::skip_on_cran()
    
    l <- rpostgisLT:::findGeoType(conn_data, list(c("example_data", "test_points_mixed")))
    expect_true(all(l$vect[[1]] == c("example_data", "test_points_mixed")),
                info = "mix of POINT and MULTIPOINT")
    l <- rpostgisLT:::findGeoType(conn_data, list(c("example_data", "test_polygons")))
    expect_true(all(l$vect[[1]] == c("example_data", "test_polygons")),
                info = "POLYGON")
    l <- rpostgisLT:::findGeoType(conn_data, list(c("example_data", "test_line")))
    expect_true(all(l$vect[[1]] == c("example_data", "test_line")),
                info = "LINESTRING")
})


rm(schema, pgtraj, view)