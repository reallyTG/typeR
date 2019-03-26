context("Test catalogue function")

test_that("Output of catalogue function is expected to be at least 1539x20", {

  catalogueAll <- catalogue()
  expect_that(dim(catalogueAll) >= c(1539,23), equals(c(TRUE, TRUE)))

})

test_that("Check output of catalogue for Plynlimon area", {

  expect_that(dim(catalogue(bbox = list(lonMin=-3.82, lonMax=-3.63,
                                        latMin=52.43, latMax=52.52)))[1],
              equals(9))

})

test_that("Check output of catalogue for minimum records of 100 years", {

  x <- catalogue(minRec=100)

  expect_that(all(c("Lee at Feildes Weir",
                    "Thames at Kingston",
                    "Elan at Caban Dam") %in% x$name), equals(TRUE))

})
