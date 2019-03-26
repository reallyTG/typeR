context('cv')
test_that("Each person one Fold", {
  theFolds <- createLeavePersonsOutFolds(lgcm)
  ids <- datas(lgcm)[,gppm:::getID(datas(lgcm))]
  uIds <- sort(unique(ids))
  folds <- vector(mode='integer',length(uIds))
  for (i in 1:length(ids)){
    idIdx = uIds==ids[i]
    if (folds[idIdx]==0){
      folds[idIdx]<-theFolds[i]
    }else{
      expect_identical(folds[idIdx],theFolds[i])
    }
  }
})


test_that("Folds roughly same size", {
  theFolds <- createLeavePersonsOutFolds(lgcm)
  proportion <- table(theFolds)/sum(table(theFolds))
  expect(all(proportion>0.09 & proportion<0.11))
})


test_that("full cv", {
  skip_on_cran()
  theT <- rnorm(10000)
  theY <- theT+rnorm(10000)
  fakeData <- data.frame(ID=rep(1:2500,4),t=theT,y=theY)
  linearReg <- gppm('b*t','noise*(t==t#)',fakeData,ID='ID',DV='y')
  theFolds <- createLeavePersonsOutFolds(linearReg,k=2)
  cvRes <- crossvalidate(linearReg,theFolds)
  expect_equal(cvRes$MSE/2,.5,tolerance=0.02)
  sum <- 0
  for (i in 1:10000){
    sum <- sum + log(dnorm(rnorm(1)))
  }
  sum <- -sum
  expect_equal(cvRes$nLPP/10000,sum/10000,tolerance=0.05)
})

