
context("package-lib")

setup(assign(".tmp.package.dir",
          file.path(getDataDir(data.env = "PACKAGE"), ".tmp"),
          env = parent.frame()))
setup(assign(".tmp.home.dir",
             file.path(tempdir(), ".tmp"),
             env = parent.frame()))
setup(dir.create(.tmp.package.dir, recursive = TRUE, showWarnings = FALSE))
setup(dir.create(.tmp.home.dir, recursive = TRUE, showWarnings = FALSE))

testthat::test_that("test on package lib functions", {
  testthat::expect(!is.null(getPreloadedDataFilename()),
                   failure_message = "getPreloadedDataFilename cannot be null")
  testthat::expect(!is.null(updatePolyhedraDatabase()),
                   failure_message = "updatePolyhedraDatabase cannot be null")
  testthat::with_mock(
       "Rpolyhedra::getUserSpace" = function(){
            .tmp.home.dir
         },
       testthat::expect(
         testthat::with_mock(
         "Rpolyhedra::getDataEnv" = function(){
           "HOME"
           }
         ,
         testthat::with_mock(
           "Rpolyhedra::checkDatabaseVersion" = function(){
             "UPDATE"
             }
           ,
           downloadRPolyhedraSupportingFiles() %in%
                  c("SUCCESS", "NOT_AVAILABLE")
     )), failure_message = "downloadRPolyhedraSupportingFiles error"))


  testthat::expect_equal(copyFilesToExtData(force = FALSE,
                                            source.folder =
                                              getDataDir(data.env =  "PACKAGE"),
                                            dest.folder = .tmp.package.dir),
                                                   TRUE)

  testthat::expect(!is.null(getPackageVersion()))
  testthat::expect(!is.null(getPackageDB()))
  testthat::expect(!is.null(getDatabaseVersion()))

  testthat::expect_equal(switchToFullDatabase(env = "PACKAGE"), "PACKAGE")
})

teardown(unlink(.tmp.package.dir, recursive = TRUE))
teardown(unlink(.tmp.home.dir, recursive = TRUE))
teardown(rm(".tmp.package.dir", envir = .GlobalEnv))
teardown(rm(".tmp.home.dir", envir = .GlobalEnv))
