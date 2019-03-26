context("p")

test_that("test that output is of correct type",
          { expect_type(seqBART(xx=xExample, yy=y1Example, datatype=datatypeExample, type = 0), "list")
            expect_type(seqBART(xx=xExample, yy=y1Example, datatype=datatypeExample, type = 1), "list")
            expect_type(seqBART(xx=xExample, yy=y2Example, datatype=datatypeExample, type = 2), "list")
          })

# test_that("test that output is of correct type",
#           expect_type(serBARTfunc(xx=xExample, yy=y1Example, datatype=datatypeExample), "list"))

# test_that("test that the input value are of correct size",
#           expect_error(serBARTfunc(xx=xx_tooSmall,yy=yy_tooSmall,datatype=datatype), regexp = NULL))

# test_that("test that the input value for type=2 is integer ",
#           expect_warning(e <- serBARTfunc(xx=xx,yy=y2,datatype=datatype, type = 2)))


#NAs !! All NAs and No NAs

#NANs

# test_that("test that the input value are of correct size",
#           {expect_error(e<-serBARTfunc26Jan("/Users/as82986/",xx=xx,yy=y2,datatype=datatype, type = 2))})

# test_that("test that func works",
#           expect_true(identical(typeof(serBARTfunc(xx=xx,yy=y01,datatype=datatype,type=1,numskip=199,burn=1000) ), "double")))

#
# test_that("test that func works",
#           {#load("/Users/as82986/BART/bartpkg1/alltypes.RData")
#             expect_type( serBARTfunc( xx=xx, yy=y01, datatype=datatype), "double")
#           }
# )
