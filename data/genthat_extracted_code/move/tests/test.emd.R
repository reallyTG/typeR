#  n<-20
#  set.seed(124)
#  r1 <- raster(matrix(rweibull(n^2,3), nrow = n))
#  r2 <- raster(matrix(rweibull(n^2,3), nrow = n))
#  r1 <- r1 / cellStats(r1,"sum")
#  r2 <- r2 / cellStats(r2,"sum")
#  emd(r1,r2,th=100)
# 
# 


context("testing emd")
test_that("emd over simple distances",{
		  r1 <- raster(matrix(c(0,0,1,0), nrow = 2))
		  r2 <- raster(matrix(c(0,1,0,0), nrow = 2))
		  r3 <- raster(matrix(c(1,0,0,0), nrow = 2))
		  r4 <- raster(matrix(c(.5,.5,0,0), nrow = 2))

		  expect_equal(as.numeric(emd(r1,r2)), sqrt(2 * .5 ^ 2))
		  expect_equal(as.numeric(emd(r1,r3)), .5, tolerance = 1e-6)
		  expect_equal(as.numeric(emd(r3,r2)), .5, tolerance = 1e-6)
		  expect_equal(as.numeric(emd(r3,r4)),
			       .25, tolerance = 1e-6)
		  expect_equal(as.numeric(emd(r4,r1)), .5 * .5 + sqrt(2 * .5 ^ 2) * .5, tolerance =
			       1e-6)
})
test_that("emd is reversable",{
		  set.seed(234)
		  r1 <- raster(matrix(rweibull(100,3), nrow = 10))
		  r2 <- raster(matrix(rweibull(100,3), nrow = 10))
		  r1 <- r1 / cellStats(r1,"sum")
		  r2 <- r2 / cellStats(r2,"sum")

		  expect_identical(emd(r1,r2), emd(r2,r1))
})
test_that("emd works with long lat",{
		  set.seed(234)
		  m <- matrix(runif(40, min = -1,1) * c(180,90),byrow = T, ncol = 4)
		  for (i in 1:nrow(m))
		  {
			  r1 <-
				  raster(
					 as.matrix(1), xmx = m[i,1] + .1, xmn = m[i,1] - .1,
					 ymx = m[i,2] + .1, ymn = m[i,2] - .1
					 )
			  r2 <-
				  raster(
					 as.matrix(1), xmx = m[i,3] + .1, xmn = m[i,3] - .1,
					 ymx = m[i,4] + .1, ymn = m[i,4] - .1
					 )
			  expect_equal(as.numeric(emd(r1,r2, gc = T)),
				       distHaversine(m[i,1:2], m[i,3:4]) / 1000)

			  expect_equal(as.numeric(emd(r1,r2, gc = F)),
				       sqrt(sum((m[i,1:2] - m[i,3:4]) ^ 2)))

		  }
})


test_that("emd thresholds simple cases",{
		  r1 <- raster(matrix(c(0,0,1,0), nrow = 2))
		  r2 <- raster(matrix(c(0,1,0,0), nrow = 2))
		  r4 <- raster(matrix(c(.5,.5,0,0), nrow = 2))

		  expect_equal(as.numeric(emd(r1,r2,th = 1)), sqrt(2 * .5 ^ 2))
		  expect_equal(as.numeric(emd(r1,r2,th = .1)), .1)

		  expect_equal(as.numeric(emd(r4,r1,th = 1)),
			       .5 * .5 + sqrt(2 * .5 ^ 2) * .5,
			       tolerance =  1e-6)
		  expect_equal(as.numeric(emd(r4,r1,th = .6)),
			       .5 * .5 + .6 * .5,
			       tolerance =  1e-6)
		  expect_equal(as.numeric(emd(r2,r4, threshold = .3)), .3 * .5)
})


test_that("emd th complex",{
		  set.seed(124)
		  r1 <- raster(matrix(rweibull(100,3), nrow = 10))
		  r2 <- raster(matrix(rweibull(100,3), nrow = 10))
		  r1 <- r1 / cellStats(r1,"sum")
		  r2 <- r2 / cellStats(r2,"sum")
		  expect_equal(emd(r1,r2, th = 12), emd(r2,r1), tolerance = 9e-5)
		  expect_equal(as.numeric(emd(r1,r2, th = .01)  )  ,
			       sum(values(abs(r1 - r2)) / 2) * .01    ,
			       tolerance = 9e-6)
		  expect_equal(as.numeric(emd(r1,r2, th = .021))  ,
			       sum(values(abs(r1 - r2)) / 2) * .021    ,
			       tolerance = 8e-6)
})

test_that("emd with gc and threshold unequal rasters",{
		  r1 <- raster(
			       as.matrix(1), xmx = 1,xmn = 0,ymx = 1,ymn = 0
			       )
		  r2 <- raster(
			       as.matrix(1), xmx = 2,xmn = 1,ymx = 2,ymn = 1
			       )
		  expect_equal(as.numeric(emd(r1,r2,gc = T)),distHaversine(c(.5,.5), c(1.5,1.5)) / 1000)

		  expect_error(
			       emd(r1,r2,gc = T, th = 1000),
			       "spatial data locations are unequal between datasets, this does not work with the fast emd"
			       )
		  expect_error(
			       emd(r1,r2,gc = F, th = 1000),
			       "spatial data locations are unequal between datasets, this does not work with the fast emd"
			       )
		  expect_equal(as.numeric(emd(r1,r2,gc = F, th = NULL)),  sqrt(2))
})
test_that("emd with gc and threshold equal rasters",{
		  r1 <- raster(
			       cbind(c(1:0),c(0,0)), xmx = 2,xmn = 0,ymx = 2,ymn = 0
			       )
		  r2 <- raster(
			       cbind(c(0,0),c(0,1)), xmx = 2,xmn = 0,ymx = 2,ymn = 0
			       )
		  expect_equal(as.numeric(emd(r1,r2,gc = T)),distHaversine(c(.5,.5), c(1.5,1.5)) / 1000)
		  expect_equal(as.numeric(emd(r1,r2,gc = T, th = 1000)),  distHaversine(c(.5,.5), c(1.5,1.5)) /
			       1000)
		  expect_equal(as.numeric(emd(r1,r2,gc = F, th = 1000)),sqrt(2))
		  expect_equal(as.numeric(emd(r1,r2,gc = T, th = 100.123)),  100.123)
		  expect_equal(as.numeric(emd(r1,r2,gc = F, th = NULL)),  sqrt(2))
		  expect_equal(as.numeric(emd(r1,r2,gc = F)),  sqrt(2))
})

test_that("large threshold is same as full and order does not matter",
	  {         set.seed(23423)
	  s1<-SpatialPointsDataFrame(matrix(ncol=2, rnorm(20)), data = data.frame(a=rep(.1,10)))
	  s2<-s1
	  s2$a<-1:10/55

	  expect_equal(e<-emd(s1,s2),emd(s1,s2, threshold=100))
	  expect_equal(e,emd(s1[sample(1:10),], s2[sample(1:10),]))
	  expect_equal(e,emd(s1[sample(1:10),], s2[sample(1:10),]), threshold=100)

	  })


test_that('emd for raster brick',
	  {
		  r<-raster(extent(0,1,0,1))
		  s<-stack(sl<-lapply(c(5,10,56,87), function(x,r){values(r)[x]<-1;r},r=r))
		  ss<-stack(ssl<-lapply(c(14,57,67), function(x,r){values(r)[x]<-1;r},r=r))

		  expect_equivalent(emd(s), dist(rasterToPoints(s)[,1:2]))
		  expect_equivalent(
				    emd(s,ss, gc=T)
				    ,
				    distm(rasterToPoints(s)[,1:2],rasterToPoints(ss)[,1:2], fun=distHaversine)/1000
				    )
		  expect_equivalent(emd(s), dist(rasterToPoints(s)[,1:2]))
		  expect_equal(  emd(s,ss, gc=T),emd(UDStack(s),UDStack(ss), gc=T))
		  expect_equal(  emd(s,ss, gc=T),emd(UDStack(sl),UDStack(ssl), gc=T))

	  }
)
test_that("emd with spatial objects, compare spdf and sp",{
		  a<-SpatialPoints(matrix(rnorm(34), ncol=2))
		  ad<-SpatialPointsDataFrame(a, data=data.frame(w=rep(1/length(a), length(a))))
		  b<-SpatialPoints(matrix(rnorm(34), ncol=2))
		  bd<-SpatialPointsDataFrame(b, data=data.frame(w=rep(1/length(b), length(b))))
		  d<-SpatialPoints(matrix(rnorm(38), ncol=2))
		  dd<-SpatialPointsDataFrame(d, data=data.frame(w=rep(1/length(d), length(d))))
		  expect_equal(emd(a,b), emd(ad,bd))
		  expect_equal(emd(a,d), emd(ad,dd))
})
test_that("emd of to dbbmms",{
		data(dbbmmstack)
		r<-split(dbbmmstack)
		expect_s3_class(emd(r[[1]],r[[2]]),"dist")

})
