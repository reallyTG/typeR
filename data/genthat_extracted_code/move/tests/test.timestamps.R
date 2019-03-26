
context('timestamps')
test_that('timestamps function works',{
		  data(leroy)
		  expect_equal(timestamps(leroy), leroy@timestamps)
		  t<-Sys.time()+1:n.locs(leroy)
		  timestamps(leroy)<-t
		  expect_equal(timestamps(leroy),t)
		  expect_error(timestamps(leroy)[5:8]<-t[1]+5:8+100)
})
