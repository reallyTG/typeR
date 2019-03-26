context("Check ant data summaries")

portal_data_path <- tempdir()

test_that("colony_presence_absence returns expected results", {
  skip_on_cran()
  colonypresabs.stake <- colony_presence_absence(path = portal_data_path, level = "Stake",
                                                rare_sp = T, unknowns = T)

  test.colony <- dplyr::filter(colonypresabs.stake, year %in% 2000:2005)
  expect_true(sum(test.colony$presence, na.rm = T) == 4930)
  expect_false(anyNA(dplyr::filter(test.colony, species != "camp fest")))
  expect_equal(nrow(test.colony), 190512)

  colonypresabs.site <- colony_presence_absence(path = portal_data_path, level = "Site", rare_sp = T, unknowns = T)
  expect_equal(unique(colonypresabs.site$species), unique(colonypresabs.stake$species))

})

test_that("bait_presence_absence returns expected results", {
  skip_on_cran()
  baitpresabs.stake <- bait_presence_absence(path = portal_data_path, level = "Stake")

  test.bait <- dplyr::filter(baitpresabs.stake, year %in% 2000:2005)
  expect_true(sum(test.bait$presence, na.rm = T) == 3420)
  expect_false(anyNA(test.bait))
  expect_equal(nrow(test.bait), 68400)

  baitpresabs.site <- bait_presence_absence(path = portal_data_path, level = "Site")
  expect_equal(unique(baitpresabs.site$species), unique(baitpresabs.stake$species))

})
