library("spduration")
context("`spdur`")

test_that("`spdur` estimates at all", {
  data(coups)
  dur.coups <- add_duration(coups, "succ.coup", unitID="gwcode", tID="year",
                            freq="year")
  spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups, silent = TRUE)
})

test_that("`na.action`` is handled", {
  data(coups)
  dur.coups <- add_duration(coups, "succ.coup", unitID="gwcode", tID="year",
                            freq="year")
  
  # Estimate model
  expect_error(
    spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups, silent = TRUE,
          na.action = na.fail),
    "missing values in object"
  )

  expect_error(
    spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups, silent = TRUE,
          na.action = na.pass),
    "na.pass is not supported"
  )
  
  expect_s3_class(spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups, silent = TRUE,
        na.action = na.omit)$na.action, "omit")
  
  expect_s3_class(spdur(duration ~ polity2, atrisk ~ polity2, data=dur.coups, silent = TRUE,
        na.action = na.exclude)$na.action, "exclude")
  
})
