#################################
# test recalib()
#

context("recalib()")
library(surveysd)
library(laeken)
library(data.table)

eusilc <- surveysd:::demo.eusilc()
eusilc <- draw.bootstrap(eusilc,REP=10,hid="db030",weights="db090",period="year",strata="db040")

# test input parameter
test_that("test para - data",{
  expect_error(recalib(as.matrix(eusilc),hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090",conH.var="db040"),"dat must be a data.frame or data.table")
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                         conP.var="rb090",conH.var="db040"),NA)
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                         conP.var=c("rb090","age"),conH.var=c("db040","hsize")),NA)
})

test_that("test para - REP",{
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep="a",period="year",
                       conP.var="rb090",conH.var="db040"),"Not all elements in b.rep are column names in dat")
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=1:10,period="year",
                       conP.var="rb090",conH.var="db040"),"Not all elements in b.rep are column names in dat")
})

test_that("test para - hid, weights and period",{
  expect_error(recalib(eusilc,hid="db030s",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090",conH.var="db040"),"db030s is not a column in dat")
  expect_error(recalib(eusilc,hid="db030",weights="db090s",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090",conH.var="db040"),"db090s is not a column in dat")
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="years",
                       conP.var="rb090",conH.var="db040"),"years is not a column in dat")
})

test_that("test para - conP.var conH.var",{
 
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090s",conH.var="db040"),"Not all elements in conP.var are column names in dat")
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090",conH.var="db040s"),"Not all elements in conH.var are column names in dat")
  
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var=NULL,conH.var="db040"),NA)
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                         conP.var="rb090",conH.var=NULL),NA)
  expect_error(recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                         conP.var=NULL,conH.var=NULL),"conH.var and conP.var cannot both be NULL")
})

test_that("test return",{
  dat.calib <- recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                       conP.var="rb090",conH.var="db040")
  rb090.compare <- dat.calib[,lapply(.SD,sum),by=list(year,rb090),.SDcols=c("db090",paste0("w",1:10))]
  expect_true(all(!is.na(rb090.compare[,.SD,.SDcols=paste0("w",1:10)])))
  rb090.compare <- rb090.compare[,lapply(.SD,function(z){abs(db090-z)/db090}),.SDcols=paste0("w",1:10)]
  expect_true(all(rb090.compare<0.01))
  
  db040.compare <- dat.calib[,lapply(.SD,function(z){sum(z[!duplicated(db030)])}),by=list(year,db040),.SDcols=c("db090",paste0("w",1:10))]
  db040.compare <- db040.compare[,lapply(.SD,function(z){abs(db090-z)/db090}),.SDcols=paste0("w",1:10)]
  expect_true(all(db040.compare<0.05))
})



