context("test-where_iata.R")

test_that("where_iata retrieval works", {
  expect_equal(where_iata("CHC"),
               data.frame(stringsAsFactors=FALSE,
                          IATA = "CHC",
                          ICAO = "NZCH",
                          Airport_name = "Christchurch International Airport",
                          Location_served = "Christchurch, New Zealand",
                          Time = "UTC+12:00",
                          DST = "Sep-Apr")
               )
  expect_equal(where_iata("YVR"),
               data.frame(stringsAsFactors=FALSE,
                          IATA = "YVR",
                          ICAO = "CYVR",
                          Airport_name = "Vancouver International Airport",
                          Location_served = "Vancouver, British Columbia, Canada",
                          Time = NA_character_,
                          DST = NA_character_)
               )
  }
)

test_that("where_iata retrieval breaks", {
  expect_error(where_iata("aaa"))
  }
)
