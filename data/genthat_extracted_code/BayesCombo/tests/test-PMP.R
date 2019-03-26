

context("BayesCombo")


test_that("PPH", {
  beta<-c(0.007, 0.014, 0.078, 0.151)
  se <- c(0.029, 0.054, 0.093, 0.179)
  
  x<- ev.combo(beta,se)
  expect_that(as.vector(tail(signif(x$pphs,5),1)), equals(c(0.026649, 0.54419 ,0.42916)))
  
})
