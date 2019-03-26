if (Sys.getenv("_LOCAL_TESTS_")=="TRUE") { ## not on CRAN (lost? see 2.15 How do I set environment variables? in R Windows FAQ)
  if(requireNamespace("testthat", quietly = TRUE)) {
    pkg   <- "spaMM"
    require(pkg, character.only=TRUE, quietly=TRUE)
    # options(error = quote({dump.frames(to.file = TRUE)})) # useful for bugs in .do_TRACE()
    if (interactive())  {
      op <- devAskNewPage(ask=FALSE)
      testfiles <- dir("C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests/testthat/",pattern="*.R",full.names = TRUE)
      #oldmaxt <- spaMM.options(example_maxtime=100)
      timings <- t(sapply(testfiles, function(fich){system.time(source(fich))}))
      #spaMM.options(oldmaxt)
      print(colSums(timings))
      ## testthat::test_package(pkg) ## for an installed package
      if (FALSE) { ## tests not included in package (using unpublished data, etc.)
        priv_testfiles <- dir("C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_private/",pattern="*.R",full.names = TRUE)
        priv_timings <- t(sapply(priv_testfiles, function(fich){system.time(source(fich))}))
        #spaMM.options(oldmaxt)
        print(colSums(priv_timings))
      }
      devAskNewPage(op)
    } else {
      report <- test_check(pkg) ## for R CMD check ## report is NULL...
      print(warnings()) # TODO? catch most of these by expect_warning(..)
    }
  } else {
    cat( "package 'testthat' not available, cannot run unit tests\n" )
  }
}
