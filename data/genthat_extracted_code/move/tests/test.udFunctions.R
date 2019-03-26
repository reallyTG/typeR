context("UD functions")
test_that('raster2contour',
          {
            data("dbbmmstack")
            data("leroydbbmm")
            s<-raster2contour(leroydbbmm ,levels=(o<-1:9/10))
            expect_equal(as.factor(o), data.frame(s)[,'level'])
            ss<-raster2contour(dbbmmstack)
            expect_equal(unique(names(dbbmmstack)) ,unique(ss$individual.local.identifier))
          })
test_that('udStack',{
  r1<-abs(rnorm(10))
  r2<-abs(rnorm(10))
s<-  stack(raster(matrix(r1/sum(r1))),raster(matrix(r2/sum(r2))))
b<-  brick(raster(matrix(r1/sum(r1))),raster(matrix(r2/sum(r2))))
bb<-UDStack(b)
ss<-UDStack(s)

bb@layers[[1]]@file@NAchanged <-ss@layers[[1]]@file@NAchanged
bb@layers[[2]]@file@NAchanged <-ss@layers[[2]]@file@NAchanged

expect_identical(bb, ss)
  
  })