context("test-engine.R")

pureMutinfo<-function(a,b){
 table(a,b)->tab
 matrix(rowSums(tab),nrow=nrow(tab),ncol=ncol(tab))->ca
 matrix(colSums(tab),nrow=nrow(tab),ncol=ncol(tab),byrow=TRUE)->cb
 tab/length(a)->p_ab
 sum(p_ab*log(length(a)*tab/ca/cb),na.rm=TRUE)
}

engineTest<-function(a,b)
 .Call(C_engineTest,a,b)

for(seed in 1:5) 
 test_that(sprintf("engine works, seed %d",seed),{
  set.seed(seed)
  N<-sample(10:900,1)
  if(runif(1)<.5){
   a<-sample(sample(N,1),N,TRUE)
   b<-sample(sample(N,1),N,TRUE)
  }else{
   a<-sample(sample(3,1),N,TRUE)
   b<-sample(sample(7,1),N,TRUE)
  }
  a<-factor(a)
  b<-factor(b)

  engineTest(a,b)->J
  expect_equal(tabulate(a),J[[2]])
  expect_equal(tabulate(b),J[[3]])
  split(paste(a,b),J[[1]])->cab
  sapply(cab,function(x) length(unique(x)))->ccab
  expect_true(all(ccab==1))
  expect_equal(setNames(sapply(cab,length),NULL),J[[4]])
  expect_equal(pureMutinfo(a,b),J[[5]])
 })
