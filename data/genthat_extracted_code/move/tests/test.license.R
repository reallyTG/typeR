context('citation')
test_that('citations',{
	a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'))
	expect_equal(licenseTerms(a), character())
	licenseTerms(a)<-"bla"
	expect_equal(licenseTerms(a),"bla")
	expect_error(licenseTerms(a)<-factor("a"))
	expect_warning(licenseTerms(a)<-c("a","a"))
})
