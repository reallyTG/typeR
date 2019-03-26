context("test-native-pure.R")

data.frame(apply(iris[,-5],2,cut,10))->X
X$const<-factor(rep(1,150))
X$tri<-factor(rep(1:3,50))
Y<-iris$Species
list(X=X,Y=Y,k=4)->input

for(algo in c("MIM","JMIM","NJMIM","JMI","DISR","CMIM","MRMR")){
 test_that(sprintf("Native %s works like pure %s",algo,algo),{
  do.call(sprintf("pure%s",algo),input)->pure
  do.call(algo,input)->native
  expect_equal(pure$score,setNames(native$score,NULL))
  expect_equal(pure$selection,names(native$selection))
 })
}

test_that("mi works like pure mi",{
 expect_equal(
  apply(X,2,mutinfo,Y),
  miScores(X,Y)
 )
})

test_that("cmi works like pure cmi",{
 Z<-factor((1:150)%%7)
 expect_equal(
  apply(X,2,condmutinfo,Y,Z),
  cmiScores(X,Y,Z)
 )
})

test_that("cmi behaves properly",{
 expect_equal(
  cmiScores(X,Y,factor(1:150)),
  apply(X,2,function(x) 0)
 )
 expect_equal(
  cmiScores(X,Y,factor(rep("Q",150))),
  miScores(X,Y)
 )
})

test_that("jmi behaves properly",{
 Z<-factor((1:150)%%7)
 expect_equal(
  jmiScores(X,Y,factor(1:150)),
  setNames(rep(miScores(data.frame(Y),Y),ncol(X)),names(X))
 )
 expect_equal(
  jmiScores(X,Y,Z),
  cmiScores(X,Y,Z)+miScores(data.frame(Y),Z)
 )
 for(e in 1:ncol(X))
  expect_equal(
   miScores(X,Y)[e],
   jmiScores(X,Y,X[,e])[e]
  )
})

test_that("impurity scores agree with pure",{
 expect_equal(impScores(X,Y),pureImp(X,Y))
})

test_that("multithread tie breaking is stable",{
 if(.Machine$sizeof.pointer!=8)
  skip("Due to numerical issues, this may be violated on 32-bit machines")
 mets<-c(MIM,JMIM,NJMIM,JMI,DISR,CMIM,MRMR,JIM)
 for(met in mets)
  expect_equal(
   met(iris[,rep(1:4,10)],iris$Species,threads=8),
   met(iris[,rep(1:4,10)],iris$Species,threads=1)
  )
})

test_that("JIM works",{
 data(MadelonD)
 JIM(MadelonD$X,MadelonD$Y,20)->ans
 expect_equal(pureImp(MadelonD$X[ans$selection[1]],MadelonD$Y),ans$score[1])
 expect_true(all(grepl("^Rel",names(ans$selection))))
})
