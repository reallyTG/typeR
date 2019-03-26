

library(mnis)
context("fixed_scope")
test_that("fixed scope functions returns expected format", {

  skip_on_cran()

  xps <- mnis_party_state('2012-01-12')

  expect_length(xps, 5)
  expect_type(xps, "list")
  expect_true(tibble::is_tibble(xps))
  expect_true(nrow(xps)==14)

  xmd <- mnis_member_date(500)

  expect_length(xmd, 21)
  expect_type(xmd, "list")
  expect_true(tibble::is_tibble(xmd))
  expect_true(nrow(xmd)==1)

  xger<- mnis_general_election_results(location_type = 'Country', location_name = 'England', start_date = '2010-01-01', end_date = '2016-01-01')
  expect_length(xger, 2)
  expect_type(xger, "list")
  expect_true(nrow(xger$election_result)==2)
  expect_true(tibble::is_tibble(xger$election_result))

  xlt <- mnis_lords_type(date= "2015-01-01")
  expect_length(xlt, 6)
  expect_type(xlt, "list")
  expect_true(tibble::is_tibble(xlt))
  expect_true(nrow(xlt)==15)

  xmdepart <- mnis_department(department_id = 0, bench = 'Government', former=TRUE)
  expect_length(xmdepart, 31)
  expect_type(xmdepart, "list")
  expect_true(tibble::is_tibble(xmdepart))


})
