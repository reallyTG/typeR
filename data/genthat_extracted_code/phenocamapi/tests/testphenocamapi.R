context("testphenocamapi")

phenos <- get_phenos()
phenos <- as.data.frame(phenos)
dukehwLat <- phenos[phenos$site=='dukehw','lat']

rois <- get_rois()
rois <- as.data.frame(rois)
dukehwLon <- rois[rois$roi_name=='dukehw_DB_1000', 'lon']

phenots <- get_pheno_ts(site = 'dukehw', vegType = 'DB', roiID = 1000, type = '3day')
phenots <- as.data.frame(phenots)
dukeB <- phenots[phenots$date=='2017-03-27', 'midday_b']

duke_middays <- get_midday_list('dukehw')
duke_awb <- get_awb_table('dukehw')

midday <- basename(duke_middays[[1]])

wb <- duke_awb$AWB[1]

duke_middays_dt <- parse_phenocam_filenames(duke_middays)
parsed_duke <- duke_middays_dt[Year==2013&DOY==155, filenames]

test_that("test getting site metadata", {
  expect_equal(dukehwLat, 35.973583)
})

test_that("test getting roi metadata", {
  expect_equal(dukehwLon, -79.100371)
})

test_that("test getting time-series data", {
  expect_equal(dukeB, 57.20225)
})

test_that("test getting midday data", {
  expect_equal(midday, "dukehw_2013_05_31_150331.jpg")
})

test_that("test getting awb data", {
  expect_equal(wb, "LIKELY_NO")
})

test_that("test parsing filenames", {
  expect_equal(parsed_duke, "dukehw_2013_06_04_120119")
})



