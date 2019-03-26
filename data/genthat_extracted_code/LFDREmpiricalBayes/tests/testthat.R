library(testthat)
library(LFDREmpiricalBayes)

##test_check("LFDREmpiricalBayes")
test_caution.parameter.actions<-function(){
  LFDR.S <- c(0.14, 0.8, 0.16, 0.94)
  LFDR.C <- c(0.21, 0.61, 0.12, 0.82)
  checkEquals(caution.parameter.actions(x1=LFDR.S, x2=LFDR.C))
}
test_caution.parameter.actions<-function(){
  expect_that(length(x1), equals(length(x2)))
    "Vectors must be of equal length."
}

test_caution.parameter.actions<-function(){
  if(length(x1)!=length((x2))){
    expect_warning(TRUE)
    expect_error(caution.parameter.actions(), 
          "Vectors must be of equal length.")
  return(NA)
  }
}
## loss values l1 and l2 >=0 (not negative)
test_caution.parameter.actions<-function(){
  if(l1<0 || l2<0){
    expect_error(caution.parameter.actions(), "Loss
                  values must be positive.")
    return(NA)
  }
}
##test results using ListReporter
library(R6)
caution_function<-R6::R6Class("caution_function",
    public = list(
        x1=NULL,
        x2=NULL,
        l1=4,
        l2=1,
       results=NULL,
       
      initialize=function(x1=NA, x2=NA, l1=4, l2=1){
        self$x1<- x1
        self$x2<- x2
        self$l1<-4
        self$l2<-1
        self$results<-caution.parameter.actions(x1,x2,l1,l2)
      
      },#end of initialize
      get_results=function(){
        testthat_results(self$results)
        expect_that(self$results$CMG1[i] == 0|| self$results$CMG1[i] == 1)
        expect_that(self$results$CMG0[i] == 0|| self$results$CMG0[i] == 1)
        expect_that(self$results$CMG0.5[i] == 0|| self$results$CMG0.5[i] == 1)
        if(self$results$CMG1[i] !=0 || self$results$CMG1[i]!=1){
          expect_error(caution.parameter.actions(), "CGM1 output must be 0 or 1")
          return(NA)
        }
        if(self$results$CMG0[i] !=0 || self$results$CMG0[i]!=1){
          expect_error(caution.parameter.actions(), "CGM0 output must be 0 or 1")
          return(NA)
        }
        if(self$results$CMG0.5[i] !=0 || self$results$CMG0.5[i]!=1){
          expect_error(caution.parameter.actions(), "CGM0.5 output must be 0 or 1")
          return(NA)
        }
      }#end of get results
      ##prints an error if the output does not print 0 or 1 values
    ))
## test results from ListReporter
testthat_results<-function(results){
  structure(results, class="testthat_results")
}

test_ME.log<-function(){
  stat_value<-c(0.02, 3.5, 7.1)##vector of test statistics
  lfdr.B_value<-data.frame(0.57,0.706,0.13)##data frame of LFDR in the big class
  p0.Big =0.3;
  ncp.Big =3.44;
  p0.Small =4.31e-05;
  ncp.Small=0.29;
  
  checkEquals(ME.log(stat=stat_value,lfdr.B=lfdr.B_value,p0.B=p0.Big,ncp.B=ncp.Big,
          p0.S=p0.Small,ncp.S=ncp.Small,a=3,lower.p0=0,upper.p0=1,lower.ncp=0.1,
          upper.ncp=50,length.p0=200,length.ncp=200))

}

test_ME.log<-function(){
  for(i in 1:length(stat)){ if(stat[i]<0){ 
      expect_warning(TRUE)
    expect_error(ME.log(), 
                 "Each index in vector of test statistics must be positive.")
    return(NA)}##end of if
    
  }##end of loop
}

