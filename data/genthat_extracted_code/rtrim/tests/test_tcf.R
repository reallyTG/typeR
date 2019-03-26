
context("Test tcf parsing")

f <- tempfile()
writeLines("
FILE F:\\TRIM\\Skylark.dat
TITLE Skylark.dat
NTIMES 8
NCOVARS 2
LABELS
 HABITAT
 Cov2
END
COMMENT Hello Bird
MISSING -1
WEIGHT Present
WEIGHTING off
SERIALCOR on
OVERDISP on
BASETIME 1
MODEL 3
COVARIATES 2
AUTODELETE off
OUTPUTFILES F
RUN", con=f)


test_that("read_tcf parses tcf files", {
  x <- read_tcf(f)
  expect_equal(x$file,"F:/TRIM/Skylark.dat")
  expect_equal(x$title,"Skylark.dat")
  expect_equal(x$ntimes,8L)
  expect_equal(x$ncovars,2L)
  expect_equal(x$labels,c("HABITAT","Cov2"))
  expect_equal(x$missing, -1L)
  expect_equal(x$weight,TRUE)
  expect_equal(x$weighting, FALSE)
  expect_equal(x$comment,"Hello Bird")
  expect_equal(x$serialcor,TRUE)
  expect_equal(x$overdisp,TRUE)
  expect_equal(x$basetime,1L)
  expect_equal(x$model,3L)
  expect_equal(x$covariates,2L)
  expect_equal(x$changepoints,integer(0))
  expect_equal(x$stepwise,FALSE)
  expect_equal(x$outputfiles,"F")
  expect_equal(x$autodelete,FALSE)
})




f <- tempfile()
writeLines("
FILE F:\\TRIM\\Skylark.dat
TITLE Skylark.dat
NTIMES 8
NCOVARS 2
LABELS
 HABITAT
 Cov2
END
COMMENT Hello Bird
MISSING -1
WEIGHT Present
WEIGHTING off
SERIALCOR on
OVERDISP on
BASETIME 1
MODEL 3
COVARIATES 2
OUTPUTFILES F
RUN
MODEL 1
OVERDISP off", con=f)

test_that("parsing multi-model files",{
  x <- read_tcf(f)
  expect_equal(length(x),2L)
  expect_equal(x[[2]]$model, 1L)
  expect_equal(x[[2]]$overdisp, FALSE)
  # crashtest
  capture.output(print(x))
})



f <- tempfile()
writeLines("
FILE F:\\TRIM\\Skylark.dat
TITLE Skylark.dat
NTIMES 8
NCOVARS 2
LABELS
 HABITAT
 Cov2
END
COMMENT Hello Bird
MISSING -1
WEIGHT Present
WEIGHTING off
SERIALCOR on
OVERDISP on
BASETIME 1
MODEL 3
BEAVIS 7
COVARIATES 2
AUTODELETE off
BUTTHEAD
OUTPUTFILES F
RUN", con=f)



g <- tempfile()
writeLines("
FILE F:\\TRIM\\Skylark.dat
TITLE Skylark.dat
NTIMES 8
NCOVARS 2
END
 HABITAT
 Cov2
LABELS
COMMENT Hello Bird
MISSING -1
WEIGHT Present
WEIGHTING off
SERIALCOR on
OVERDISP on
BASETIME 1
MODEL 3
COVARIATES 2
AUTODELETE off
OUTPUTFILES F
RUN", con=g)


test_that("warning on invalid keys",{
  expect_warning(read_tcf(f),regex = "BEAVIS.*?BUTTHEAD")
  expect_error(read_tcf(g),regex="LABELS")
})



