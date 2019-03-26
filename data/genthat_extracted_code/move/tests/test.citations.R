context('citation')
test_that('citations',{
	a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'))
	expect_equal(citations(a), character())
	citations(a)<-"bla"
	expect_equal(citations(a),"bla")
	expect_error(citations(a)<-factor("a"))
	expect_warning(citations(a)<-c("a","a"))
})
test_that('citations move function',{
	expect_warning(q<-move(1:10,1:10, Sys.time()+1:10, animal=gl(5,2), data=data.frame(citation=gl(5,2))),
		       'There were more than one citation for this study found! Only using the first.')
	expect_equal(citations(q),"1")
}
)
