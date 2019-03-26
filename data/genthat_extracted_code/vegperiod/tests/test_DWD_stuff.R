context("DWD stuff")

test_that("download of list of stations works", {
  # don't run download tests on cran, travis, appveyor
  skip_on_cran(); skip_on_travis(); skip_on_appveyor()

  # Structure
  # .
  # ├── daily
  # │   ├── climate
  # │   │   ├── historic
  # │   │   └── recent
  # │   └── precip
  # │       ├── historic
  # │       └── recent
  # └── monthly
  #     ├── climate
  #     │   ├── historic
  #     │   └── recent
  #     └── precip
  #         ├── historic
  #         └── recent

  # Test some of the possible lists not all.

  # Column widths, and thus parsing, is different for daily and monthly lists.
  # All monthly station lists have floating point elev.
  # A data.frame with 8 columns ist constructed during reading/parsing.
  # If parsing went well, the columns should have proper types.

  # DAILY =====================================================================
  # daily climate recent ------------------------------------------------------
  expect_silent(stations <- read.DWDstations())
  expect_is(stations, 'data.frame')
  expect_length(stations, 8)
  expect_gt(nrow(stations), 1000)

  expect_is(stations$id,   'integer')
  expect_is(stations$from, 'Date')
  expect_is(stations$to,   'Date')
  expect_is(stations$elev, 'integer')
  expect_is(stations$lat,  'numeric')
  expect_is(stations$long, 'numeric')

  # daily climate historic ----------------------------------------------------
  expect_silent(stations <- read.DWDstations(period='historic'))
  expect_is(stations, 'data.frame')
  expect_length(stations, 8)
  expect_gt(nrow(stations), 1000)

  expect_is(stations$id,   'integer')
  expect_is(stations$from, 'Date')
  expect_is(stations$to,   'Date')
  expect_is(stations$elev, 'integer')
  expect_is(stations$lat,  'numeric')
  expect_is(stations$long, 'numeric')

  # daily precip recent -------------------------------------------------------
  expect_silent(precip <- read.DWDstations(type='precip'))
  expect_is(precip, 'data.frame')
  expect_length(precip, 8)
  expect_gt(nrow(precip), 3000)

  expect_is(precip$id,   'integer')
  expect_is(precip$from, 'Date')
  expect_is(precip$to,   'Date')
  expect_is(precip$elev, 'integer')
  expect_is(precip$lat,  'numeric')
  expect_is(precip$long, 'numeric')


  # MONTHLY ===================================================================
  # monthly climate recent ----------------------------------------------------
  expect_silent(stations <- read.DWDstations(resolution='monthly'))
  expect_is(stations, 'data.frame')
  expect_length(stations, 8)
  expect_gt(nrow(stations), 1000)

  expect_is(stations$id,   'integer')
  expect_is(stations$from, 'Date')
  expect_is(stations$to,   'Date')
  expect_is(stations$elev, 'numeric')
  expect_is(stations$lat,  'numeric')
  expect_is(stations$long, 'numeric')

  # monthly precip historic ---------------------------------------------------
  expect_silent(precip <- read.DWDstations(type='precip', period='historic',
                                           resolution='monthly'))
  expect_is(precip, 'data.frame')
  expect_length(precip, 8)
  expect_gt(nrow(precip), 3000)

  expect_is(precip$id,   'integer')
  expect_is(precip$from, 'Date')
  expect_is(precip$to,   'Date')
  expect_is(precip$elev, 'numeric')
  expect_is(precip$lat,  'numeric')
  expect_is(precip$long, 'numeric')
})


test_that("download of data works", {
  # don't run download tests on cran, travis, appveyor
  skip_on_cran(); skip_on_travis(); skip_on_appveyor()

  # fetch last 500 days worth of data from station Göttingen ------------------
  expect_silent(clim <- read.DWDdata(id=1691, quiet=TRUE))
  expect_true(file.exists(file.path(tempdir(), "tageswerte_KL_01691_akt.zip")))

  expect_is(clim, 'data.frame')
  expect_length(clim, 18)
  expect_equal(nrow(clim), 550)

  expect_is(clim$STATIONS_ID, 'integer')
  expect_equal(unique(clim$STATIONS_ID), 1691L)
  expect_is(clim$MESS_DATUM,  'Date')
  expect_is(clim$QN_3,        'integer')
  expect_is(clim$RSK,         'numeric')
  expect_is(clim$RSKF,        'integer')
  expect_is(clim$TMK,         'numeric')


  # download historical data from the Brocken if curl available ---------------
  skip_if_not_installed('curl')

  expect_silent(climb <- read.DWDdata(722, period='historical', quiet=TRUE))
  expect_is(climb, 'data.frame')
  expect_length(climb, 18)
  expect_gt(nrow(climb), 550)

  expect_is(climb$STATIONS_ID, 'integer')
  expect_equal(unique(climb$STATIONS_ID), 722L)
  expect_is(climb$MESS_DATUM,  'Date')
  expect_is(climb$QN_3,        'integer')
  expect_is(climb$RSK,         'numeric')
  expect_is(climb$RSKF,        'integer')
  expect_is(climb$TMK,         'numeric')
})
