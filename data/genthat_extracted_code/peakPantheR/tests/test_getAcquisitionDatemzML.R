context('getAcquisitionDatemzML()')

# test we get Acquisition date from mzML


test_that('get Acquisition date from real mzML, verbose', {
  realmzML      <- system.file("testdata/test_fakemzML.mzML", package = "peakPantheR")
  expected_date <- as.POSIXct("2017-07-13 21:06:14")

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(realmzML, verbose=TRUE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(length(result$messages), 1)
})

test_that('get Acquisition date from real mzML, no verbose', {
  realmzML      <- system.file("testdata/test_fakemzML.mzML", package = "peakPantheR")
  expected_date <- as.POSIXct("2017-07-13 21:06:14")

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(realmzML, verbose=FALSE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check no message
  expect_equal(length(result$messages), 0)
})

test_that('detect not an mzML, verbose', {
  wrongmzML     <- './path/notAmzML.png'
  expected_date <- NA
  msg           <- "Check input, mzMLPath must be a .mzML\n"

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=TRUE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(result$messages, msg)
})

test_that('detect not an mzML, no verbose', {
  wrongmzML     <- './path/notAmzML.png'
  expected_date <- NA

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=FALSE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(length(result$messages), 0)
})

test_that('detect wrong XML, verbose', {
  # create wrong XML file
  xmlfile               <- XML::xmlParse(system.file("testdata/test_fakemzML.mzML", package = "peakPantheR"))
  xmltop                <- XML::xmlRoot(xmlfile)
  XML::xmlName(xmltop)  <- "not_indexedmzML"
  wrongmzML             <- file.path(tempdir(),'notValidXML.mzML')
  XML::saveXML(xmlfile, file=wrongmzML)
  # expected
  expected_date <- NA
  msg           <- "Check input, mzMLPath is not a valid mzML file\n"

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=TRUE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(result$messages[1], msg)
})

test_that('detect wrong XML, no verbose', {
  # create wrong XML file
  xmlfile               <- XML::xmlParse(system.file("testdata/test_fakemzML.mzML", package = "peakPantheR"))
  xmltop                <- XML::xmlRoot(xmlfile)
  XML::xmlName(xmltop)  <- "not_indexedmzML"
  wrongmzML             <- file.path(tempdir(),'notValidXML.mzML')
  XML::saveXML(xmlfile, file=wrongmzML)
  # expected
  expected_date <- NA

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=FALSE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(length(result$messages), 0)
})

test_that('try catch failure mzML, verbose', {
  wrongmzML     <- './path/notAmzML.mzML'
  expected_date <- NA
  msg           <- "Check input, failure while parsing mzMLPath\n"

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=TRUE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(length(result$messages), 2)
  expect_equal(result$messages[1], msg)
})

test_that('try catch failure mzML, no verbose', {
  wrongmzML     <- './path/notAmzML.mzML'
  expected_date <- NA

  # results (output, warnings and messages)
  result  <- evaluate_promise(getAcquisitionDatemzML(wrongmzML, verbose=FALSE))

  # Check result
  expect_equal(result$result, expected_date)

  # Check message (cannot match execution time)
  expect_equal(length(result$messages), 0)
})
