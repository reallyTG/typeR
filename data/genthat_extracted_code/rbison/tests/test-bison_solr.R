context("bison_solr")

test_that("bison_solr works", {
  skip_on_cran()
  

  vcr::use_cassette("bison_solr_one", {
    out_1 <- bison_solr(scientificName='Ursus americanus', verbose = FALSE)
    expect_that(out_1$facets$facet_queries, equals(NULL))
    expect_is(out_1$points, "data.frame")
    expect_is(out_1, "bison_solr")
  }, 
  match_requests_on = c("method", "uri", "query"), 
  preserve_exact_body_bytes = TRUE)

  vcr::use_cassette("bison_solr_two", {
    out_2 <- bison_solr(scientificName='Ursus americanus', 
                        state_code='New Mexico', 
                        fl="scientificName", verbose = FALSE)
    expect_that(out_2$highlight, equals(NULL))
    expect_that(out_2$points[[1]][1], equals("Ursus americanus"))
    expect_is(out_2, "bison_solr")
  }, 
  match_requests_on = c("method", "uri", "query"), 
  preserve_exact_body_bytes = TRUE)

  vcr::use_cassette("bison_solr_three", {
    out_3 <- bison_solr(scientificName='Ursus americanus', 
                        state_code='New Mexico', rows=50, 
                        fl="occurrence_date,scientificName", verbose = FALSE)
    expect_is(out_3, "bison_solr")
  }, 
  match_requests_on = c("method", "uri", "query"), 
  preserve_exact_body_bytes = TRUE)

  vcr::use_cassette("bison_solr_four", {
    out_4 <- bison_solr()
    expect_that(nrow(out_4$points), equals(10))
  }, preserve_exact_body_bytes = TRUE)

  vcr::use_cassette("bison_solr_five", {
    out_5 <- bison_solr(scientificName='Helianthus annuus', rows=800, 
                        verbose = FALSE)
    out_5_map <- bisonmap(out_5)

    expect_is(out_5_map, "gg")
    expect_is(out_5_map$data, "data.frame")
    expect_is(out_5_map$layers, "list")
    expect_named(out_5_map$labels, c("x", "y", "group"))
    expect_is(out_5_map$plot, "environment")
  }, 
  match_requests_on = c("method", "uri", "query"), 
  preserve_exact_body_bytes = TRUE)
})


test_that("bison_solr can do length 2 queries for parameters", {
  skip_on_cran()
  
  vcr::use_cassette("bison_solr_lengthtwo", {
    out <- bison_solr(eventDate = c('2010-08-08', '2010-08-21'))

    expect_is(out, "bison_solr")
    expect_gte(
      as.numeric(as.POSIXct(min(out$points$eventDate))),
      as.numeric(as.POSIXct('2010-08-08'))
    )
    expect_lte(
      as.numeric(as.POSIXct(max(out$points$eventDate))),
      as.numeric(as.POSIXct('2010-08-21'))
    )
  }, 
  match_requests_on = c("method", "uri", "query"), 
  preserve_exact_body_bytes = TRUE)
})


test_that("bison_solr fails with length > 2 queries for parameters", {
  skip_on_cran()
  
  expect_error(
    bison_solr(eventDate = c('2010-08-08', '2010-08-21', "afdf")),
    "`bions_solr` only supports length 1 or 2 inputs"
  )
})


test_that("bison_solr fails with length 2 queries that are not numeric or date", {
  skip_on_cran()
  
  expect_error(
    bison_solr(eventDate = c('asdfadf', "afdf")),
    "for 'eventDate' ~ `bison_solr` only supports numeric/integer"
  )
})
