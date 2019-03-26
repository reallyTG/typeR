source('testhelpers.R')
context('measurements')

try({
  boxes = osem_boxes()
})

test_that('measurements can be retrieved for a phenomenon', {
  check_api()

  measurements = osem_measurements('Windgeschwindigkeit')
  measurements = osem_measurements(x = 'Windgeschwindigkeit')
  expect_true(tibble::is.tibble(measurements))
  expect_true('osem_measurements' %in% class(measurements))
})

test_that('measurement retrieval does not give progress information in non-interactive mode', {
  check_api()

  if (!opensensmapr:::is_non_interactive()) skip('interactive session')

  out = capture.output({
    measurements = osem_measurements(x = 'Licht')
  })
  expect_length(out, 0)
})

test_that('a response with no matching senseBoxes gives an error', {
  check_api()

  expect_error(osem_measurements(x = 'foobar', exposure = 'indoor'), 'No senseBoxes found')
})

test_that('columns can be specified for phenomena', {
  check_api()

  cols = c('value', 'boxId', 'boxName')
  measurements = osem_measurements(x = 'Windgeschwindigkeit', columns = cols)
  expect_equal(names(measurements), cols)
})

test_that('measurements can be retrieved for a phenomenon and exposure', {
  check_api()

  measurements = osem_measurements(x = 'Temperatur', exposure = 'unknown',
                                    columns = c('value', 'boxId', 'boxName'))
  expect_equal(nrow(measurements), 0)
})

test_that('measurements of specific boxes can be retrieved for one phenomenon and returns a measurements data.frame', {
  check_api()

  # fix for subsetting
  class(boxes) = c('data.frame')
  three_boxes = boxes[1:3, ]
  class(boxes) = c('sensebox', 'data.frame')
  three_boxes = osem_as_sensebox(three_boxes)
  phens = names(osem_phenomena(three_boxes))

  measurements = osem_measurements(x = three_boxes, phenomenon = phens[[1]])
  expect_true(is.data.frame(measurements))
  expect_true('osem_measurements' %in% class(measurements))
})

test_that('measurements can be retrieved for a bounding box', {
  check_api()

  sfc = sf::st_sfc(sf::st_linestring(x = matrix(data = c(7, 8, 50, 51), ncol = 2)), crs = 4326)
  bbox = sf::st_bbox(sfc)
  measurements = osem_measurements(x = bbox, phenomenon = 'Windrichtung')
  expect_true(all(unique(measurements$lat) > 50))
  expect_true(all(unique(measurements$lat) < 51))
  expect_true(all(unique(measurements$lon) < 8))
  expect_true(all(unique(measurements$lon) > 7))
})

test_that('measurements can be retrieved for a time period', {
  check_api()

  from_date = as.POSIXct('2018-01-01 12:00:00')
  to_date = as.POSIXct('2018-01-01 13:00:00')
  measurements = osem_measurements(x = 'Temperature', from = from_date, to = to_date)

  expect_true(all(measurements$createdAt < to_date))
  expect_true(all(measurements$createdAt > from_date))
})

test_that('measurements can be retrieved for a time period > 31 days', {
  check_api()

  from_date = as.POSIXct('2017-11-01 12:00:00')
  to_date = as.POSIXct('2018-01-01 13:00:00')
  measurements = osem_measurements(x = 'Windrichtung', from = from_date, to = to_date)

  expect_true(all(measurements$createdAt < to_date))
  expect_true(all(measurements$createdAt > from_date))
})

test_that('both from and to are required when requesting measurements, error otherwise', {
  expect_error(osem_measurements(x = 'Temperature', from = as.POSIXct('2017-01-01')), 'only together with')
  expect_error(osem_measurements(x = 'Temperature', to   = as.POSIXct('2017-01-01')), 'only together with')
})

test_that('phenomenon is required when requesting measurements, error otherwise', {
  check_api()

  expect_error(osem_measurements(), 'missing, with no default')
  expect_error(osem_measurements(boxes), 'Parameter "phenomenon" is required')

  sfc = sf::st_sfc(sf::st_linestring(x = matrix(data = c(7, 8, 50, 51), ncol = 2)), crs = 4326)
  bbox = sf::st_bbox(sfc)
  expect_error(osem_measurements(bbox), 'Parameter "phenomenon" is required')
})

test_that('[.osem_measurements maintains attributes', {
  check_api()

  sfc = sf::st_sfc(sf::st_linestring(x = matrix(data = c(7, 8, 50, 51), ncol = 2)), crs = 4326)
  bbox = sf::st_bbox(sfc)
  m = osem_measurements(x = bbox, phenomenon = 'Windrichtung')

  expect_true(all(attributes(m[1:nrow(m), ]) %in% attributes(m)))
})

test_that('data.frame can be converted to measurements data.frame', {
  m = osem_measurements('Windrichtung')
  df = osem_as_measurements(data.frame(c(1, 2), c('a', 'b')))
  expect_equal(class(df), class(m))
})

test_that('requests can be cached', {
  check_api()

  osem_clear_cache()
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 0)
  osem_measurements('Windrichtung', cache = tempdir())

  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 1)

  # no download output (works only in interactive mode..)
  out = capture.output({
    m = osem_measurements('Windrichtung', cache = tempdir())
  })
  expect_length(out, 0)
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 1)

  osem_clear_cache()
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 0)
})
