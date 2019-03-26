context("password and username")

test_that("user and password are set", {
  skip_on_cran()
  expect_false(is.na(Sys.getenv("NSAPIACCOUNT", unset = NA)))
  expect_false(is.na(Sys.getenv("NSAPIPW", unset = NA)))
})

test_that("passwordchecker is telling us something", {
  skip_on_cran()
  expect_message(check_ns_api_keys(), regexp = "username is set")
})

context("utility functions")
test_that("utility functions are working", {
  expect_identical(null_to_na(NULL), NA)
  expect_match(message_part(TRUE), regexp = "is set")
  expect_match(message_part(FALSE), regexp = "is NOT set")


  expect_match(datetime("2012-02-27", "12:51"), "2012-02-27T12:51")
  expect_error(datetime(date = 201354, "26587"))
  expect_error(datetime(date = "201354", 26587))
})

test_that("utility function date is working",{
  # date time stamp is current time in the netherlands time zone.
  expect_equal(parse_time("2012-02-27T12:51:00+0100"), as.POSIXct("2012-02-27 12:51:00", tz = "Europe/Amsterdam"))
})


context("travel_advise")

test_that("arguments of travel_advise are tested correctly", {
  skip_on_cran()
  expect_error(get_travel_advise(fromStation = "Amsterdam Centraal", toStation = "Rotterdam Centraal", departure = NA, yearCard = TRUE), regexp = "departure and yearCard can only be TRUE or FALSE")
  expect_error(get_travel_advise(fromStation = "Amsterdam Centraal", toStation = "Rotterdam Centraal", departure = TRUE, yearCard = 1), regexp = "departure and yearCard can only be TRUE or FALSE")
  expect_error(get_travel_advise(fromStation = "Amsterdam Centraal", toStation = "Rotterdam Centraal", departure = TRUE, yearCard = TRUE, previousAdvises = "alpha"), regexp = "need to be numeric")
  expect_error(get_travel_advise(fromStation = "Amsterdam Centraal", toStation = "Rotterdam Centraal", departure = TRUE, yearCard = TRUE, previousAdvises = c(1, 2, 3)), regexp = "need to be numeric")
  expect_error(get_travel_advise(toStation = "Rotterdam Centraal", departure = TRUE, yearCard = TRUE, previousAdvises = 3))
  expect_error(get_travel_advise(toStation = "Rotterdam Centraal", departure = TRUE, yearCard = TRUE, previousAdvises = 3))
  expect_error(get_travel_advise(toStation = NULL, departure = TRUE, yearCard = TRUE, previousAdvises = 1, nextAdvises = 1))
})

test_that("travel_advise returns proper values", {
  skip_on_cran()
  advise_today <- get_travel_advise(fromStation = "Amsterdam Centraal", toStation = "Rotterdam Centraal", departure = TRUE, yearCard = TRUE, previousAdvises = 1, nextAdvises = 1)
  expect_true(is.data.frame(advise_today))
})


# all parsing files.

# empty call
# disruptions_and_maintenance()
context("disruptions")
storing_zonder_ongepland <- list(
  Ongepland = list(
    "\n\t\t\n\t"
  ),
  Gepland = list(
    Storing = list(
      id = list(
        "idnumber1"
      ),
      Traject = list(
        "Station tot station"
      ),
      Periode = list(
        "vector of time"
      ),
      Bericht = list(
        "heel veel tekst"
      )
    ),
    Storing = list(
      id = list(
        "idnumber2"
      ),
      Traject = list(
        "Station tot station"
      ),
      Periode = list(
        "vector of time"
      ),
      Bericht = list(
        "heel veel tekst"
      )
    )
  )
)

storing_met_ongepland <- list(
  Ongepland = list(
    Storing = list(
      id = list("prio-13345"),
      Traject = list("'s-Hertogenbosch-Nijmegen"),
      Reden = list("beperkingen op last van de politie"),
      Datum = list("2010-12-16T11:16:00+0100")
    )
  ),
  Gepland = list(
    "\n\t\t\n\t"
  )
)

test_that("parsing of disruptions works", {
  # checking if testobjects are correct
  expect_true(is.list(storing_zonder_ongepland))
  expect_true(any(names(storing_zonder_ongepland) == c("Ongepland", "Gepland")))
  expect_true(any(names(storing_met_ongepland) == c("Ongepland", "Gepland")))
  testframe1 <- parse_disruptions(storing_zonder_ongepland)
  testframe2 <- parse_disruptions(storing_met_ongepland)
  expect_true(is.data.frame(testframe1))
  expect_true(is.data.frame(testframe2))
  expect_true(all(names(testframe1) == c("id", "Traject", "Periode", "Reden", "Bericht", "Advies", "Datum")))
  expect_true(all(names(testframe2) == c("id", "Traject", "Periode", "Reden", "Bericht", "Advies", "Datum")))
  expect_match(testframe1$id[[1]], "idnumber1")
  expect_match(testframe2$id[[1]], "prio-13345")
  rm(testframe2, testframe1)
})

test_that("disruptions call functions",{
  skip_on_cran()
  expect_error(disruptions_and_maintenance(actual = FALSE,unplanned = FALSE))
  expect_match(class(get_current_disruptions()),"data.frame")
  expect_match(class(get_scheduled_engineering_work()),"data.frame")
  expect_match(class(get_disruptions_station("Utrecht Centraal")),"data.frame")
})


rm(storing_zonder_ongepland)




# parse_reismogelijkheden()

# find_reisdelen()
