context("summarise")

script <- system.file('examples/SAScode/Macros/fun2.SAS', package='sasMap')

test_that("Summarise SAS script", {
  
  expectedSummary <-
    structure(
      list(
        name = "fun2.SAS",
        lines = 12L,
        procs = "sql",
        datasteps = 0L,
        macroCalls = "util1",
        macroDefs = "fun2"
      ),
      .Names = c(
        "name",
        "lines",
        "procs",
        "datasteps",
        "macroCalls",
        "macroDefs"
      )
    )
  
  
  expect_equal(summariseSASScript(script), expectedSummary)
  
})





