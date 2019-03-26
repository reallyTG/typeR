context('corridor')
test_that("corridor",{
  data(leroy)
  expect_s4_class(   corridor(leroy),'MoveBurst')
  expect_warning(expect_s4_class(corridor(leroy,speedProp = .99, circProp = .01),'MoveBurst'),'No corridor points found')
  })

test_that("cor length",{
  
		   expect_error(corridor(move(1,1,Sys.time(), proj='+proj=longlat')),"The data-set has 2 or less fixes")
		   expect_error(corridor(move(1:2,1:2,Sys.time()+1:2, proj='+proj=longlat')),"The data-set has 2 or less fixes")

  })
