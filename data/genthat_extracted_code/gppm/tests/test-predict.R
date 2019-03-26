context('predict')

test_that("cross check with idependent calculation", {
  fakeData <- data.frame(ID=rep(1,5),t=c(0,10,22,15,33),y=c(40,25,88,1,2))
  fakeDataTrain <- fakeData[1:2,]
  fakeDataTest <- fakeData[3:5,]

  lgcm <- gppm('muI+muS*t','sigmaI^2+sigmaS^2*t*t#+covIS*(t+t#)+noise^2*(t==t#)',fakeDataTrain,ID='ID',DV='y')
  paras <- c(58,-1,sqrt(258),sqrt(0.4),0,sqrt(10))
  names(paras) <- pars(lgcm)
  lgcmFit <- fit(lgcm,init=paras,useOptimizer=FALSE)
  thePreds <- predict(lgcmFit,fakeDataTest)
  plot(thePreds,1)
  expect_identical(round(thePreds$predMean[[1]][2]),19)
  expect_identical(round(thePreds$predCov[[1]][2,2]),28)
})


#50% of variance explained
test_that("cross check with idependent calculation 2", {
  skip_on_cran()
  theT <- rnorm(10000)
  theY <- theT+rnorm(10000)
  fakeData <- data.frame(ID=rep(1:2500,4),t=theT,y=theY)
  fakeDataTrain <- fakeData[1:2,]
  fakeDataTest <- fakeData[3:10000,]

  linearReg <- gppm('b*t','noise*(t==t#)',fakeDataTrain,ID='ID',DV='y')
  truePars <- c(1,1)
  names(truePars) <- pars(linearReg)
  theFit <- fit(linearReg,init = truePars,useOptimizer = FALSE)
  thePreds <- predict(theFit,fakeDataTest,verbose=FALSE)
  accRes <- accuracy(thePreds)
  expect_equal(accRes$MSE/2,.5,tolerance=0.05)

  sum <- 0
  for (i in 3:10000){
    sum <- sum + log(dnorm(rnorm(1)))
  }
  sum <- -sum
  expect_equal(accRes$nLPP/10000,sum/10000,tolerance=0.05)


  truePars <- c(0,2)
  names(truePars) <- pars(linearReg)
  theFit <- fit(linearReg,init = truePars,useOptimizer = FALSE)
  thePreds <- predict(theFit,fakeDataTest,verbose=FALSE)
  accRes <- accuracy(thePreds)
  expect_equal(accRes$MSE/2,1,tolerance=0.05)

  sum <- 0
  for (i in 1:length(fakeDataTest$y)){
    sum <- sum + log(dnorm(fakeDataTest$y[i],sd=sqrt(2)))
  }
  sum <- -sum
  expect_equal(accRes$nLPP/10000,sum/10000,tolerance=0.00001)
})

test_that("thePlot", {
  skip_on_cran()
  newData <- demoLGCM
  newData[,c('t')] <- newData[,c('t')] + 0.0000001
  thePreds <- predict(lgcmFit,newData)
  tmp <- plot(thePreds,10)
  expect_equal(class(tmp)[1],'gg')
})

