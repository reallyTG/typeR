context("HURDAT")

## ---- Data -------------------------------------------------------------------
df.al <- get_hurdat(basin = "AL")
df.ep <- get_hurdat(basin = "EP")

## ---- Saved Data -------------------------------------------------------------
load(system.file("extdata", "al.Rda", package = "HURDAT"))
load(system.file("extdata", "ep.Rda", package = "HURDAT"))

## ---- HURDAT url's -----------------------------------------------------------
test_that("HURDAT url's", {
    expect_identical(al_hurdat2(), "http://www.aoml.noaa.gov/hrd/hurdat/hurdat2.html")
    expect_identical(ep_hurdat2(), "http://www.aoml.noaa.gov/hrd/hurdat/hurdat2-nepac.html")
})

## ---- Dataframe Comparison ---------------------------------------------------
test_that("Dataframe Comparison", {
    expect_identical(AL, df.al)
    expect_identical(EP, df.ep)
})

## ---- Errors -----------------------------------------------------------------
test_that("hurdat errors", {
    expect_error(get_hurdat(basin = "CP"), "Basin must be AL for EP")
})
