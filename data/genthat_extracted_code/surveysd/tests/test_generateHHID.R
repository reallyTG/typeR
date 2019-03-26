#################################
# test generate.HHID()
#

context("generate.HHID()")
library(surveysd)
library(laeken)
library(data.table)

eusilc <- surveysd:::demo.eusilc()
eusilc[,rb030split:=rb030]
# create spit households
eusilc[,rb030split:=rb030]
year <- eusilc[,unique(year)]
year <- year[-1]
leaf_out <- c()
for(y in year){
  split.person <- eusilc[year==(y-1)&!duplicated(db030)&!db030%in%leaf_out,
                         sample(rb030,20)]
  overwrite.person <- eusilc[year==(y)&!duplicated(db030)&!db030%in%leaf_out,
                             .(rb030=sample(rb030,20))]
  overwrite.person[,c("rb030split","year_curr"):=.(split.person,y)]
  
  eusilc[overwrite.person,rb030split:=i.rb030split,on=.(rb030,year>=year_curr)]
  leaf_out <- c(leaf_out,
                eusilc[rb030%in%c(overwrite.person$rb030,overwrite.person$rb030split),
                       unique(db030)])
}

# test input parameter
test_that("test para - data",{
  expect_error(generate.HHID(as.matrix(eusilc),period="year",pid="rb030",hid="db030"),
               "dat must be a data.frame or data.table")
  expect_error(generate.HHID(eusilc,period="year",pid="rb030",hid="db030"),NA)
})


test_that("test para - hid, pid and period",{
  expect_error(generate.HHID(eusilc,period="years",pid="rb030",hid="db030"),
               "years is not a column of dat")
  expect_error(generate.HHID(eusilc,period="year",pid="rb030s",hid="db030"),
               "rb030s is not a column of dat")
  expect_error(generate.HHID(eusilc,period="year",pid="rb030",hid="db030s"),
               "db030s is not a column of dat")
  
  eusilc[,year.char:=as.character(year)]
  expect_error(generate.HHID(eusilc,period="year.char",pid="rb030",hid="db030"),
               "year.char must be an integer or numeric vector")
})

test_that("test return",{
  dat.HHID <- generate.HHID(eusilc,period="year",pid="rb030split",hid="db030")
  dat.HHID <- dat.HHID[,uniqueN(db030),by=rb030split][V1>1]
  expect_true(nrow(dat.HHID)==0)
})

