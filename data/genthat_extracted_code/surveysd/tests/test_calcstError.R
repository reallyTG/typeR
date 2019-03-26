#################################
# test calc.stError()
#
Sys.unsetenv("R_TESTS")

context("calc.stError()")
library(surveysd)
library(laeken)
library(data.table)

eusilc <- surveysd:::demo.eusilc()

eusilc <- draw.bootstrap(eusilc,REP=10,hid="db030",weights="db090",period="year",strata="db040")
eusilc <- recalib(eusilc,hid="db030",weights="db090",b.rep=paste0("w",1:10),period="year",
                  conP.var="rb090",conH.var="db040")

# test input parameter
test_that("test para - data",{
  expect_error(calc.stError(as.matrix(eusilc),weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040")),"dat must be a data.frame or data.table")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040")),NA)
})

test_that("test para - weights, b.weights, year and group",{
  expect_error(calc.stError(eusilc,weights="db090",b.weights="a",period="year",var="povmd60",
                            group=c("rb090","db040")),"Not all elements in b.rep are column names in dat")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=1:10,period="year",var="povmd60",
                            group=c("rb090","db040")),"Not all elements in b.rep are column names in dat")
  
  expect_error(calc.stError(eusilc,weights="db090s",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040")),"db090s is not a column in dat")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="years",var="povmd60",
                            group=c("rb090","db040")),"years is not a column in dat")
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090s","db040")),"Not all elements on group are column names in dat")
  
  eusilc.est <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                             group=list("rb090","db040",c("rb090","db040"),c("hsize","age")))
  ngroups <- eusilc[,uniqueN(rb090)+uniqueN(db040)+uniqueN(paste(rb090,db040))+uniqueN(paste(hsize,age))]
  expect_true(nrow(unique(eusilc.est$Estimates,by=c("rb090","db040","hsize","age")))==ngroups+1)
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=list("rb090","db040",c("rb090","db040"),c("hsize","age"))),NA)
})


test_that("test para - period.diff, period.mean",{
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),period.mean=NULL),NA)
  expect_warning(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              group=c("rb090","db040"),period.mean=4),"period.mean must be odd - mean over periods will not be calculated")
  
  diff.warning <- capture_warnings(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                                                group=c("rb090","db040"),period.diff = "2015-2008"))
  expect_true(diff.warning[1]=="Removing 2015-2008 from period.diff - period(s) not present in column year\n")
  expect_true(diff.warning[2]=="No differences will be calculated\n")
  
  expect_warning(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              group=c("rb090","db040"),period.diff = c("2015-2008","2016-2011")),"Removing 2015-2008 from period.diff - period(s) not present in column year",fixed=TRUE)
  
  expect_warning(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              group=c("rb090","db040"),period.diff = c("2015-2010","2016-2011"),period.mean=3),"Cannot calculate differences between periods 2015 and 2010 over 3 periods.")
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),period.diff = c("2015-2011","2016-2012"),period.mean=3),NA)
})

test_that("test para - bias, size.limit, cv.limit, p",{
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),bias="FALSE"),"bias can only be TRUE of FALSE")
  eusilc.bias <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              group=c("rb090","db040"),bias=TRUE)
  expect_true("mean_povmd60"%in%colnames(eusilc.bias$Estimates))
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),size.limit="10"),"size.limit must contain one numeric value")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),size.limit=1:10),"size.limit must have length 1")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),size.limit=50),NA)
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),cv.limit=1:10),"cv.limit must have length 1")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),cv.limit="1"),"cv.limit must contain one numeric value")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),cv.limit=20),NA)
  
  
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),p=".5"),"p must be a numeric vector")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),p=c(.1,.7,1.2)),"Values in p must be between 0 and 1")
  expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                            group=c("rb090","db040"),p=c(.1,.7,.9)),NA)
})

test_that("test return",{
  eusilc.est <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                             group=c("rb090","db040"))
  eusilc.comp <- rbindlist(list(eusilc[,.(V1=weightedRatio(povmd60,db090),N_true=sum(db090)),by=year],
                                eusilc[,.(V1=weightedRatio(povmd60,db090),N_true=sum(db090)),by=list(year,rb090)],
                                eusilc[,.(V1=weightedRatio(povmd60,db090),N_true=sum(db090)),by=list(year,db040)]),use.names=TRUE,fill=TRUE)
  eusilc.comp <- merge(eusilc.comp, eusilc.est$Estimates[,.(year,rb090,db040,N,val_povmd60)])
  expect_true(nrow(eusilc.comp[V1!=val_povmd60])==0)
  expect_true(nrow(eusilc.comp[N_true!=N])==0)
})


# these are some longer tests
if(Sys.info()["user"]=="gussenbauer"){
  
  test_that("test para -  var and fun",{
    
    # source_test_helpers("helper_myfun.R")
    
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60s",
                              group=c("rb090","db040")),"Not all elements in var are column names in dat")
    
    eusilc[sample(.N,100),povmd60NA:=NA]
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60NA",
                              group=c("rb090","db040")),NA)
    
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              fun=myfun.undefined,group=c("rb090","db040")),"object 'myfun.undefined' not found")
    
    myfun <- function(x,w){
      return(sum(w*x))
    }
    myfun.char <- function(x,w){
      return(as.character(sum(w*x)))
    }
    myfun.mulval <- function(x,w){
      return(w*x)
    }
    
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60NA",
                              fun=myfun,group=c("rb090","db040")),NA)
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              fun=myfun,group=c("rb090","db040")),NA)
    
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              fun=myfun.char,group=c("rb090","db040")),"Function in fun does not return integer or numeric value")
    
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="povmd60",
                              fun=myfun.mulval,group=c("rb090","db040")),"Function in fun does return more than one value. Only functions which return a single value are allowed.")
    
    help_gini <- function(x,w){
      laeken::gini(x,w)$value
    }
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="eqIncome",
                              fun=help_gini,group=c("rb090","db040")),NA)
    
  })
  
  test_that("test para -  implemented functions",{
    
    comp <- rep(FALSE,1000)
    for(i in 1:1000){
      x <- sample(c(1,0,NA_real_),200,prob=c(.45,.45,.1),replace=TRUE)
      w <- sample(30:400,200,replace=TRUE)
      
      r_res <- surveysd:::weightedRatioR(x,w)
      c_res <- weightedRatio(x,w)
      
      comp[i] <- abs(r_res-c_res)<1e-10
    }
    expect_true(all(comp))
    comp <- rep(FALSE,1000)
    for(i in 1:1000){
      x <- sample(c(1,0,NA_real_),200,prob=c(.45,.45,.1),replace=TRUE)
      w <- sample(30:400,200,replace=TRUE)
      
      r_res <- surveysd:::weightedSumR(x,w)
      c_res <- weightedSum(x,w)
      
      comp[i] <- abs(r_res-c_res)<1e-10
    }
    expect_true(all(comp))
  })
  
  test_that("test para - fun.adjust.var and adjust.var",{
    
    group <- list("rb090","db040",c("rb090","db040"))
    povmd <- function(x,w){
      md <- laeken::weightedMedian(x,w)*0.6
      pmd60 <- x<md
      return(as.integer(pmd60))
    }
    
    expect_error(calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                              period="year",var="povmd60",fun=weightedRatio,
                              group=group,fun.adjust.var=povmd,adjust.var="eqIncome"),NA)
    
    myfun.char <- function(x,w){
      return(as.character(sum(w*x)))
    }
    expect_error(calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                              period="year",var="povmd60",fun=weightedRatio,
                              group=group,fun.adjust.var=myfun.char,adjust.var="eqIncome"),"Function in fun.adjust.var does not return integer or numeric value")
    
    expect_error(calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                              period="year",var="povmd60",fun=weightedRatio,
                              group=group,fun.adjust.var=povmd,adjust.var=1),"adjust.var needs to be a character")
    expect_error(calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                              period="year",var="povmd60",fun=weightedRatio,
                              group=group,fun.adjust.var=povmd,adjust.var="1"),"adjust.var must be a column name in dat")
    expect_error(calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                              period="year",var="povmd60",fun=weightedRatio,
                              group=group,fun.adjust.var=povmd,adjust.var=c("eqIncome","1")),"adjust.var can only be a single variable name")
    
    
    # compare fun.adjust.var with results not using fun.adjust.var
    err.est <- calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                            period="year",var="povmd60",fun=weightedRatio,
                            group=group,fun.adjust.var=povmd,adjust.var="eqIncome")
    povmd2 <- function(x,w){
      md <- laeken::weightedMedian(x,w)*0.6
      pmd60 <- x<md
      # weighted ratio is directly estimated inside my function
      return(sum(w[pmd60])/sum(w)*100)
    }
    
    err.est.different <- calc.stError(eusilc,weights="rb050",b.weights=paste0("w",1:10),
                                      period="year",var="eqIncome",fun=povmd2,
                                      group=group,fun.adjust.var=NULL,adjust.var=NULL)
    
    
    expect_true(all.equal(err.est.different$Estimates[is.na(rb090)&is.na(db040),.(val_eqIncome,stE_eqIncome)],
                          err.est$Estimates[is.na(rb090)&is.na(db040),.(val_povmd60,stE_povmd60)],
                          check.attributes = FALSE))
    expect_false(isTRUE(all.equal(err.est.different$Estimates[!(is.na(rb090)&is.na(db040)),.(val_eqIncome,stE_eqIncome)],
                                  err.est$Estimates[!(is.na(rb090)&is.na(db040)),.(val_povmd60,stE_povmd60)],
                                  check.attributes = FALSE)))
    
  })
  
  test_that("test para -  add.arg",{
    
    fun <- function(x,w,b,a){
      sum(x*w*b)
    }
    add.arg = list(b="onePerson",c="randNumber")
    
    eusilc[,onePerson:=.N==1,by=.(db030,year)]
    eusilc[,randNumber:=rnorm(.N)]
    
    add.arg = list(b="onePerson",c="randNumber")
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="eqIncome",
                              fun=fun,group=c("rb090","db040"),add.arg=add.arg),"c not argument\\(s\\) of supplied function.")
    
    add.arg = list(b="onePerson",a="abcde")
    expect_error(calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="eqIncome",
                              fun=fun,group=c("rb090","db040"),add.arg=add.arg),"abcde not in column names of dat.")
    
    add.arg = list(b="onePerson",a="randNumber")
    res_1 <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="eqIncome",
                          fun=fun,group=c("rb090","db040"),add.arg=add.arg)
    
    fun <- function(x,w,b,a){
      sum(x*w*b*a)
    } 
    
    res_2 <- calc.stError(eusilc,weights="db090",b.weights=paste0("w",1:10),period="year",var="eqIncome",
                          fun=fun,group=list(c("rb090","db040")),add.arg=add.arg)
    res_2 <- res_2$Estimates[!is.na(rb090)&nchar(year)==4][,.(year=as.numeric(year),rb090,db040,val_eqIncome)]
    res_direct <- eusilc[,fun(eqIncome,db090,onePerson,randNumber),by=.(year,rb090,db040)]
    res <- merge(res_2,res_direct,by=c("year","rb090","db040"))
    expect_true(nrow(res[val_eqIncome!=V1])==0)
  })
}







