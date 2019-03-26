context("rpostgisLT: manipulate-ltraj")

# test_equal() won't work for ltraj-es with infolocs due to the funky infolocs as factors...

test_that("missing relocations", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty, ibex_na))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_na"),
                   "successfully")
    expect_true(all.equal(ibex_na, ibexTest))
    
    try(pgtrajDrop(conn_empty, "ibex_na"))
})

test_that("rounding timestamps", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty, ibex_4h))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_4h"),
                   "successfully")
    expect_true(all.equal(ibex_4h, ibexTest))
    
    try(pgtrajDrop(conn_empty, "ibex_4h"))
})

test_that("interpolate ltraj in space", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty, ibex_int_space, infolocs = TRUE))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_int_space"),
                   "successfully")
    expect_match(all.equal(ibex_int_space, ibexTest),
                   "Component 4: Component 7: Mean relative difference:",
                 all = FALSE) # due to date rounding
    # time rounding causing all.equal == FALSE
    # ibexTest[[1]]$date == ibex[[1]]$date
    # all.equal(as.integer(ibex[[1]]$date),as.integer(ibexTest[[1]]$date)))
    
    try(pgtrajDrop(conn_empty, "ibex_int_space"))
})

test_that("interpolate ltraj in time", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty, ibex_int_time, infolocs = TRUE))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_int_time"),
                   "successfully")
    expect_true(all.equal(ibex_int_time, ibexTest))
    
    try(pgtrajDrop(conn_empty, "ibex_int_time"))
})

test_that("infolocs name change of step_id", {
    skip("doesn't work with adehabitatLT >0.3.21")
    expect_true(ltraj2pgtraj(conn_empty, ibex_int_time, infolocs = TRUE))
    infolocs(ibex_int_time)[[1]]$step_id <- 1
    infolocs(ibex_int_time)[[2]]$step_id <- 1
    infolocs(ibex_int_time)[[3]]$step_id <- 1
    infolocs(ibex_int_time)[[4]]$step_id <- 1
    expect_true(ltraj2pgtraj(conn_empty, ibex_int_time, overwrite = TRUE, infolocs = TRUE))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_int_time"),
                   "successfully")
    expect_match(all.equal(ibex_int_time, ibexTest),
                   "infolocs",
                   all = FALSE)
    # Infolocs name step_id is changed due to conflict
    
    try(pgtrajDrop(conn_empty, "ibex_int_time"))
})

test_that("add infolocs column DB manually", {
    skip("doesn't work with adehabitatLT >0.3.21")
    expect_true(ltraj2pgtraj(conn_empty, ibex_int_time, infolocs = TRUE))
    rpostgis::dbColumn(conn_empty,
                       c("traj", "infolocs_ibex_int_time"),
                       colname = "test",
                       coltype = "text")
    DBI::dbExecute(conn_empty, "UPDATE traj.infolocs_ibex_int_time SET test = 'foo';")
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_int_time"),
                   "successfully")
    expect_match(all.equal(ibex_int_time, ibexTest),
                   "infolocs",
                   all = FALSE)
    # Infolocs name step_id is changed due to conflict, manually added column 'test' is imported
    
    try(pgtrajDrop(conn_empty, "ibex_int_time"))
})

test_that("subset on given parameters", {
    testthat::skip_on_cran()
    ibex_ld <- adehabitatLT::ld(ibex)
    ## We work on the data frame from the trajectory, which we subset, and
    ## then rebuild the ltraj without recomputing trajectory parameters;
    ## this is essentially what 'hab::subset' does.
    ## Note that the steps are not continuous any more.
    ibex_x <- droplevels(ibex_ld[ibex_ld$dist < 400 & !is.na(ibex_ld$dist),])
    ibex_subset <- adehabitatLT::dl(ibex_x)
    
    expect_true(ltraj2pgtraj(conn_empty, ibex_subset))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_subset"),
                   "successfully")
    expect_equal(ibex_subset, ibexTest)
    
    try(pgtrajDrop(conn_empty, "ibex_subset"))
})

test_that("subsample on the temporal sequence", {
    testthat::skip_on_cran()
    ibex_subsample <- adehabitatLT::subsample(ibex, 14400 * 2)
    expect_true(ltraj2pgtraj(conn_empty, ibex_subsample))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_subsample"),
                   "successfully")
    expect_equal(ibex_subsample, ibexTest)
    
    try(pgtrajDrop(conn_empty, "ibex_subsample"))
})

test_that("cut if there is a step greater than 3000 m", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty, ibex_cut))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_cut"),
                   "successfully")
    expect_equal(ibex_cut, ibexTest)
    
    try(pgtrajDrop(conn_empty, "ibex_cut"))
})

test_that("bind back by individual", {
    testthat::skip_on_cran()
    ibex_bind <- bindltraj(ibex_cut)
    expect_true(ltraj2pgtraj(conn_empty, ibex_bind))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_bind"),
                   "successfully")
    expect_equal(ibex_bind, ibexTest)
    
    try(pgtrajDrop(conn_empty, "ibex_bind"))
})

test_that("combine trajectories", {
    testthat::skip_on_cran()
    ibex2 <- ibex
    burst(ibex2) <- paste(burst(ibex2), "2", sep = "-")
    ibex_combined <- c(ibex, ibex2)[order(id(c(ibex, ibex2)))]
    attr(ibex_combined, "proj4string") <- CRS() # proj4string attributes needs to be added
    expect_true(ltraj2pgtraj(conn_empty, ibex_combined))
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex_combined"),
                   "successfully")
    expect_equal(ibex_combined, ibexTest)
    
    try(pgtrajDrop(conn_empty, "ibex_combined"))
})
