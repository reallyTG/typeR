
context("db-lib")
testthat::test_that("create minimal db", {
  initDataDirEnvironment()
  testthat::expect_equal(selectDataEnv("PACKAGE"), "PACKAGE")
  source.config.netlib <- PolyhedronScraperConfigurationNetlib.class$new()
  source.config.dmccooey <- PolyhedronScraperConfigurationDmccoey.class$new()
  testthat::expect_equal(source.config.netlib$getBaseDir("destdir"),
               file.path("destdir", "sources", "www.netlib.org", "polyhedra"))
  testthat::expect_equal(source.config.dmccooey$getBaseDir("destdir"),
               file.path("destdir", "sources", "dmccooey.com", "polyhedra"))
  testthat::expect_equal(
              length(source.config.netlib$getPolyhedraFiles(getDataDir())),
               119)
  testthat::expect_equal(
              length(source.config.dmccooey$getPolyhedraFiles(getDataDir())),
               9)

  db <- PolyhedraDatabase.class$new()
  #FIXME for building testcase: polyhedroncannot exist
  # if it is not in the database.
  db$existsPolyhedron(source = "netlib", polyhedron.name = "tetrahedron")
  db$getPolyhedronFilename(source = "netlib", polyhedron.name = "tetrahedron",
                           extension = ".RDS.zip")
  #test sources
  db$addSourceConfig(source.config = source.config.netlib)
  db$addSourceConfig(source.config = source.config.dmccooey)

  db$schedulePolyhedraSources(sources.config =
                                getPackageEnvir(".available.sources"),
                              source.filenames = NULL)
  db$scrape(mode = "scrape.queued", sources = "netlib", max.quant = 3,
            skip.still.queued = FALSE, save.on.change = FALSE)
  db$scrape(mode = "scrape.queued", sources = "dmccooey", max.quant = 3,
            skip.still.queued = TRUE, save.on.change = FALSE)
  testthat::expect_equal(db$getAvailablePolyhedra()$scraped.name,
               c("tetrahedron", "octahedron", "cube",
                 "10-truncated triakis icosahedron (canonical)",
    "4-5-truncated deltoidal hexecontahedron with truncation depth chosen",
                 "132-pentagon polyhedron"
               ))
  #TODO understand why generateTestTasks doesn't get covered by covr package
  tasks <- db$
    generateTestTasks(TestTaskClass = PolyhedronTestTaskScrape.class,
                      max.quant = 3)
  testthat::expect_equal(length(tasks), 3)
  #TODO
  #testRR
})
