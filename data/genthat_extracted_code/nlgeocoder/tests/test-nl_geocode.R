context("nl_geocode")

test_that("Class of object returned is sf", {
  skip_on_cran()
  res <- nl_geocode("Martinikerkhof 3 Groningen")
  expect_true(class(res)[1] == "sf")
})

test_that("type = adres", {
  skip_on_cran()
  res <- nl_geocode("Martinikerkhof 3 Groningen")
  expect_true(res$type == "adres")
})

test_that("Geocode a vector of adresses", {
  skip_on_cran()
  res <- nl_geocode(c("Martinikerkhof 3, Groningen", "9712 JN 4", "Henri Faasdreef 312 Den Haag", "Hoofdstraat 1A Een"))
  expect_true(nrow(res) == 4)
})

test_that("No NULL values", {
  skip("Nice to have, but not right now")
  res <- nl_geocode(c("Martinikerkhof 3, Groningen", "9712 JN 4", "Henri Faasdreef 312 Den Haag", "Hoofdstraat 1A Een"))
  cols <- colnames(res)
  for (i in seq_along(cols)){expect_true(sum(is.na(res[[cols[i]]])) == 0, label = paste0(cols[i], " does not contain NULL values"))}
})

test_that("Location returned is in WGS84", {
  skip_on_cran()
  res <- nl_geocode("Martinikerkhof 3 Groningen")
  expect_true(class(res$centroide_ll)[1] == "sfc_POINT")
})

test_that("Location returned is in RD_New", {
  skip_on_cran()
  res <- nl_geocode("Martinikerkhof 3 Groningen", output = "rd")
  expect_true(class(res$centroide_rd)[1] == "sfc_POINT")
})

test_that("Dataframe returned (not an sf object)", {
  res <- nl_geocode("Martinikerkhof 3 Groningen", output = "data.frame")
  expect_true(class(res) == "data.frame")
})

test_that("return as wgs84 is working",{
  res <- nl_geocode("Martinikerkhof 3 Groningen", output = "wgs84")
  expect_equal(sf::st_crs(res), sf::st_crs(4326))
})

test_that("return as rd is working",{
  res <- nl_geocode("Martinikerkhof 3 Groningen", output = "rd")
  expect_equal(sf::st_crs(res), sf::st_crs(28992))
})

test_that("return as data.frame is working",{
  res <- nl_geocode("Martinikerkhof 3 Groningen", output = "data.frame")
  expect_true(is.data.frame(res))
})

test_that("restrict search to Groningen", {
  res <- nl_geocode("Hoofdstraat", fq = "provincienaam:Groningen")
  expect_true(res$provincienaam == "Groningen")
})

test_that("restrict fields", {
  res <- nl_geocode("Hoofdstraat", fl = c("woonplaatsnaam", "centroide_ll"))
  expect_equal(names(res), c("woonplaatsnaam", "centroide_ll"))
})
