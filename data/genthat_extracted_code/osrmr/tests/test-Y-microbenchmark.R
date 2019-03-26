context("microbenchmark")

test_that("microbenchmark test for osrm package", {
  skip("Test only if runtime has to be checked")

  lat1 <- 47.168
  lng1 <- 8.117
  lat2 <- 46.978
  lng2 <- 8.335

  if(localhost) { run_server(osrm_path) }

  t1 <- summary(microbenchmark::microbenchmark(
    osrmr::viaroute(lat1, lng1, lat2, lng2, F, api_version, localhost),
    times = 50L, unit = "ms"))$uq
  expect_equal(t1 < 400, T)

  if(localhost) { quit_server() }
})

