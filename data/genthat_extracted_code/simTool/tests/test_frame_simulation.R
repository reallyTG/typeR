testthat::context("test_frame_simulation.R")

dg <- expand_tibble(fun = c("Gen A", "Gen B"), para = 1:2)
pg <- expand_tibble(proc = c("Ana A", "Ana B", "Ana C"))
sim <-
  list(
    list(
      list(data = "1. set", results = list(c(res = "Gen A 1 Ana A"), c(res = "Gen A 1 Ana B"), c(res = "Gen A 1 Ana C"))),
      list(data = "2. set", results = list(c(res = "Gen A 1 Ana A"), c(res = "Gen A 1 Ana B"), c(res = "Gen A 1 Ana C")))
    ),

    list(
      list(data = "1. set", results = list(c(res = "Gen B 1 Ana A"), c(res = "Gen B 1 Ana B"), c(res = "Gen B 1 Ana C"))),
      list(data = "2. set", results = list(c(res = "Gen B 1 Ana A"), c(res = "Gen B 1 Ana B"), c(res = "Gen B 1 Ana C")))
    ),

    list(
      list(data = "1. set", results = list(c(res = "Gen A 2 Ana A"), c(res = "Gen A 2 Ana B"), c(res = "Gen A 2 Ana C"))),
      list(data = "2. set", results = list(c(res = "Gen A 2 Ana A"), c(res = "Gen A 2 Ana B"), c(res = "Gen A 2 Ana C")))
    ),

    list(
      list(data = "1. set", results = list(c(res = "Gen B 2 Ana A"), c(res = "Gen B 2 Ana B"), c(res = "Gen B 2 Ana C"))),
      list(data = "2. set", results = list(c(res = "Gen B 2 Ana A"), c(res = "Gen B 2 Ana B"), c(res = "Gen B 2 Ana C")))
    )
  )

fs <- frame_simulation(dg, pg, sim, NULL) %>%
  tidyr::unnest() %>%
  tidyr::unite("expected", c("fun", "para", "proc"), sep = " ")

test_that("Create a tibble containing the results for every replication", {
  expect_identical(fs$results, fs$expected)
})


sim <-
  list(
    list(
      list(
        results =
          list(mean = list(c(res = "Gen A 1 Ana A"), c(res = "Gen A 1 Ana B"), c(res = "Gen A 1 Ana C")))
      )
    ),

    list(
      list(
        results =
          list(mean = list(c(res = "Gen B 1 Ana A"), c(res = "Gen B 1 Ana B"), c(res = "Gen B 1 Ana C")))
      )
    ),

    list(
      list(
        results =
          list(mean = list(c(res = "Gen A 2 Ana A"), c(res = "Gen A 2 Ana B"), c(res = "Gen A 2 Ana C")))
      )
    ),

    list(
      list(
        results =
          list(mean = list(c(res = "Gen B 2 Ana A"), c(res = "Gen B 2 Ana B"), c(res = "Gen B 2 Ana C")))
      )
    )
  )

fs <- frame_simulation(dg, pg, sim, mean) %>%
  tidyr::unnest() %>%
  tidyr::unite("expected", c("fun", "para", "proc"), sep = " ")

test_that("Create a tibble containing the results sumamrized by one summary function", {
  expect_identical(fs$results, fs$expected)
})
