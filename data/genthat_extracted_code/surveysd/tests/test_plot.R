#################################
# test plot.surveysd()
#

context("plot.surveysd()")
library(surveysd)
library(laeken)
library(data.table)
library(ggplot2)

eusilc <- surveysd:::demo.eusilc()

eusilc <- draw.bootstrap(eusilc,REP=10,hid="db030",weights="db090",period="year",strata="db040")
eusilc <- recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                  conP.var="rb090",conH.var="db040")
res <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                       group=list("rb090","db040",c("rb090","db040"),"hsize"))

# test input parameter
test_that("test para - variable and type",{
  
  expect_error(plot(res),NA)
  
  expect_error(plot(res,variable = "povmd60s"), "No results for povmd60s present in the data!")
  expect_error(plot(res,variable = "povmd60"), NA)
  
  expect_error(plot(res,variable = "povmd60",type="summarys"), "Parameter type can only take values 'summary' or 'grouping'!")
  expect_error(plot(res,variable = "povmd60",type="summary"),NA)
  
  expect_error(plot(res,variable = "povmd60",type="grouping"),"Paramter 'groups' cannot be NULL if type='grouping'!")
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090"),NA)
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090s"),
               "Variables in 'groups' must contain variables from x$params$group!",fixed=TRUE)
  
})

test_that("test para - groups and sd.type",{
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090",sd.type = "dots"),"Parameter 'sd.type' can only take values 'ribbon' or 'dot'!")
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090",sd.type = "ribbon"),NA)
  
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","rb090"),sd.type = "ribbon"),NA)
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","rb090"),sd.type = "dot"),NA)
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","hsize"),sd.type = "ribbon"),
               "No results for the combination of db040 and hsize present in the data")
})

res <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                       group=list("rb090","db040",c("rb090","db040"),"hsize"),period.mean=NULL)

test_that("test para - without period.mean",{
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090",sd.type = "dots"),"Parameter 'sd.type' can only take values 'ribbon' or 'dot'!")
  expect_error(plot(res,variable = "povmd60",type="grouping",groups="rb090",sd.type = "ribbon"),NA)
  
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","rb090"),sd.type = "ribbon"),NA)
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","rb090"),sd.type = "dot"),NA)
  expect_error(plot(res,variable = "povmd60",type="grouping",groups=c("db040","hsize"),sd.type = "ribbon"),
               "No results for the combination of db040 and hsize present in the data")
})
