context("Helper functions")

test_that("req_e() must produce correct rates", {
  output <- c("RR3", "RR4", "REF2", "CON2", "LOC2")
  expect_setequal(req_e(), output)
})

test_that("Default rates must be correct based on 'e'", {
  s1 <- c("RR1", "RR2", "RR5", "RR6", "COOP1", "COOP2",
          "COOP3", "COOP4",  "REF1", "REF3", "CON1",
          "CON3", "LOC1")
  s2 <- c("RR1", "RR2", "RR3", "RR4", "RR5", "RR6",
          "COOP1", "COOP2",  "COOP3", "COOP4", "REF1",
          "REF2", "REF3", "CON1", "CON2", "CON3",
          "LOC1", "LOC2")
  expect_setequal(default_rates(), s1)
  expect_setequal(default_rates(e = 0.5), s2)
})
