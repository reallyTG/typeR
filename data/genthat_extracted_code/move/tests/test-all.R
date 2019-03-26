library(testthat)
test_check("move")
if(F){
  require(testthat)
  tmp<-reportCoverage(sourcefiles=list.files('../R', full.names = T),
                 executionfiles=list.files('testthat', full.names = T))
  tmp<-reportCoverage(sourcefiles=list.files('../R', full.names = T),
                 executionfiles='testthat/test.smallFunctions.R')
  tmp<-reportCoverage(sourcefiles=list.files('../R', full.names = T),
                      executionfiles='test-all.R')
  cov<-package_coverage(); shine(cov)
}
