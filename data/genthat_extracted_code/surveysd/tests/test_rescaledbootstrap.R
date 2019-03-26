#################################
# test rescaled.bootstrap()
#

context("rescaled.bootstrap()")
library(surveysd)
library(laeken)
library(data.table)

data("eusilc")
setDT(eusilc)
eusilc[,N.households:=sum(db090[!duplicated(db030)]),by=db040]
eusilc[!duplicated(db030),N.households.error:=sum(db090),by=db040]
eusilc[,N.households.all:=sum(db090[!duplicated(db030)])]

# test input parameter
test_that("test para - data",{
  expect_error(rescaled.bootstrap(as.matrix(eusilc),REP="a",strata="db040",cluster="db030",fpc="N.households"),
               "dat needs to be a data frame or data table")
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households"),NA)
})

test_that("test para - REP",{
  expect_error(rescaled.bootstrap(eusilc,REP="a",strata="db040",cluster="db030",fpc="N.households"),
               "REP needs to be numeric")
  expect_warning(rescaled.bootstrap(eusilc,REP=c(1:10),strata="db040",cluster="db030",fpc="N.households"),
                 "REP has length >1 - First argument will be used!")
})

test_that("test para - strata, cluster and fpc",{
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db0400",cluster="db030",fpc="N.households"),
               "dat does not contain the column(s): db0400",fixed=TRUE)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040>db030",cluster="db030",fpc="N.households"),
               "strata, cluster, and fpc need to have the same number of arguments separated with '>'")
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="10",fpc="N.households"),
               "dat does not contain the column(s): 10",fixed=TRUE)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db040>db030",fpc="N.households"),
               "strata, cluster, and fpc need to have the same number of arguments separated with '>'")
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040>db030",cluster="db040>db030",fpc="N.households>N.something"),
               "dat does not contain the column(s): N.something",fixed=TRUE)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="I",cluster="db030",fpc="N.households"),
               "values in N.households do vary in some strata-cluster combinations at stage 1")
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="1",cluster="db030",fpc="N.households"),
               "values in N.households do vary in some strata-cluster combinations at stage 1")
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households.error"),
               "missing values not allowed in fpc")
  
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="I",fpc="N.households"),NA)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="1",fpc="N.households"),NA)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="1",cluster="db030",fpc="N.households.all"),NA)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="I",cluster="db030",fpc="N.households.all"),NA)
})


test_that("test para - check.input",{
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households",check.input=FALSE),NA)
  expect_error(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households",check.input="FALSE"),
               "check.input can only be logical")
})

 
test_that("test para - single.PSU",{
  expect_warning(rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households",single.PSU="something"),
                 "single.PSU was not set to either 'merge' or 'mean'!\n Bootstrap replicates for single PSUs cases will be missing!",fixed=TRUE)
})

test_that("test return",{
  dat.boot <- rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households")
  expect_true(ncol(dat.boot)==(10+ncol(eusilc)))
  dat.unique <- unique(dat.boot[,mget(c("db030",paste0("bootRep",1:10)))])
  expect_true(nrow(dat.unique[,.N,by=db030][N>2])==0)
  expect_false(any(unlist(dat.boot[,
                               lapply(.SD,function(z){any(is.infinite(z))}),
                               .SDcols=c(paste0("bootRep",1:10))])))
  expect_false(any(is.na(dat.boot[,.SD,.SDcols=c(paste0("bootRep",1:10))])))
  expect_true(all(dat.boot[,.SD,.SDcols=c(paste0("bootRep",1:10))]>0))
  
  dat.boot <- rescaled.bootstrap(eusilc,REP=10,strata="db040",cluster="db030",fpc="N.households",return.value = "replicates")
  expect_true(ncol(dat.boot)==10)
})











