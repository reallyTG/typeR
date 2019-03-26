# test descent tools

context("descent tools")


test_that("list_prod",{
  expect_identical(list_prod(list(1,1/2,2,1)
  ), 1)
  
})

test_that("gradient zeros",{
  fik<-matrix(c(1,0,0,1),nrow = 2)
  adj.factor<-matrix(1/2,nrow =2 ,ncol =1)
  Alt<-c(125,375)
  Depth<-c(1000,1000)
  expect_identical(grzero(fik,adj.factor,Alt,Depth),
                   c(0.25,0.75)
  )
  
})

test_that("gradient",{
  fik<-matrix(c(1,0,0,1),nrow = 2)
  adj.factor<-matrix(1/2,nrow =2 ,ncol =1)
  Alt<-c(125,375)
  Depth<-c(1000,1000)
  centers<-c(0.25,0.75)
  expect_identical(grbase(fik,adj.factor,centers,Alt,Depth),
                   c(0,0)
  )
  
})