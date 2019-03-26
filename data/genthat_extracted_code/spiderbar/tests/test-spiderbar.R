context("basic functionality")
test_that("parsing and fetch testing and sitemaps work", {

  cdc <- paste0(readLines(system.file("extdata", "cdc-robots.txt", package="spiderbar")), collapse="\n")
  rt1 <- robxp(cdc)

  expect_that(rt1, is_a("robxp"))

  expect_that(can_fetch(rt1, "/asthma/asthma_stats/default.htm", "*"), equals(TRUE))
  expect_that(can_fetch(rt1, "/_borders", "*"), equals(FALSE))

  imdb <- paste0(readLines(system.file("extdata", "imdb-robots.txt", package="spiderbar")), collapse="\n")
  rt2 <- robxp(imdb)
  cd <- crawl_delays(rt2)

  expect_that(cd, is_a("data.frame"))
  expect_equal(sort(cd$crawl_delay), sort(c(0.1, 3.0, -1.0)))

  imdb <- readLines(system.file("extdata", "imdb-robots.txt", package="spiderbar"))
  rt2 <- robxp(imdb)

  gh <- paste0(readLines(system.file("extdata", "github-robots.txt", package="spiderbar")), collapse="\n")
  rt3 <- robxp(gh)

  rt3 <- robxp(file(system.file("extdata", "github-robots.txt", package="spiderbar")))

  expect_equal(sitemaps(rt1), "http://www.cdc.gov/niosh/sitemaps/sitemapsNIOSH.xml")
  expect_equal(sitemaps(rt2), "http://www.imdb.com/sitemap_US_index.xml.gz")
  expect_equal(sitemaps(rt3), character(0))

})
