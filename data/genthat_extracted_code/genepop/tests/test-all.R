if (Sys.getenv("_LOCAL_TESTS_")=="TRUE") { ## not on CRAN
  if(require("testthat", quietly = TRUE)) {
    pkg   <- "genepop"
    require(pkg, character.only=TRUE, quietly=TRUE)
    if (interactive())  {
      testfiles <- dir("C:/home/francois/travail/stats/Genepop_R/Genepop/tests/testthat/",pattern="*.R",full.names = TRUE)
      timings <- t(sapply(testfiles,function(fich){system.time(source(fich))}))
      print(colSums(timings))
      ## test_package(pkg) ## for an installed package
    } else {
      report <- test_check(pkg) ## for R CMD check ## report is NULL...
      print(warnings()) # TODO? catch most of these by expect_warning(..)
    }
  } else {
    cat( "package 'testthat' not available, cannot run unit tests\n" )
  }
}
