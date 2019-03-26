context("ledger-lib")
testthat::test_that("create minimal ledger", {
  ledger <- ScraperLedger.class$new()
  #initialize variables
  source.config.netlib <- getPackageEnvir(".available.sources")[["netlib"]]

  scrapeInLedger <- function(ledger, source.config, filename){
    #Simulates scrape desired behavior
    polyhedra.dir <- source.config$getBaseDir(getPackageDir())
    source <- source.config$getName()
    ledger$addFilename(source = source, source.filename = filename)
    ledger$updateStatus(source = source,
                        source.filename = filename,
                        status = "scraping")
    scraped.polyhedron <- source.config$scrape(
      polyhedron.file.id = filename,
      file.path(polyhedra.dir,
                filename))
    ledger$updateStatus(source = source,
                        source.filename = filename,
                        status = "scraped",
                        scraped.polyhedron = scraped.polyhedron)
  }
  #Fill ledger
  scrapeInLedger(ledger = ledger, source.config = source.config.netlib,
                 filename = "0")
  scrapeInLedger(ledger = ledger, source.config = source.config.netlib,
                 filename = "1")
  scrapeInLedger(ledger = ledger, source.config = source.config.netlib,
                 filename = "2")

  # Execute functions
  ledger.crc   <-  ledger$getCRCPolyhedronName(source = "netlib",
                                               polyhedron.name = "tetrahedron")
  testthat::expect_equal(ledger$getAvailableSources(), "netlib")
  testthat::expect_equal(ledger$getAvailablePolyhedra()$scraped.name,
                                        c("tetrahedron", "octahedron", "cube"))
  testthat::expect_equal(
            unique(ledger$getFilenamesStatus(status = "scraped")$status),
            "scraped")
  testthat::expect_equal(
            unique(ledger$getFilenamesStatusMode(mode = "test")$status),
            "scraped")

  ledger$countStatusUse(status.field = "status", status = "scraped")

})
