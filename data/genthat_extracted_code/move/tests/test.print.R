context("print")
test_that("print dbmvar",{
  data("leroydbbmm")
  expect_output(print( slot(leroydbbmm,'DBMvar')), "margin      : 11")
  expect_output(print( slot(leroydbbmm,'DBMvar')), "window size : 31")
  
    })

test_that("print move",{
  data("leroy")
  expect_output(print(leroy), "class       : Move")
  expect_output(print(leroy), "sensors     : gps")
  expect_silent(t<-strftime(format="%m",timestamps( leroy)[-1]))
  expect_output(print( burst(leroy, t)),sprintf('bursts      : X02: %i, X03: %i',table(t)[1],table(t)[2]))
  leroy@license<-"asdfasd"
  expect_output(print(leroy), "license     : asdfasd")


  
})
