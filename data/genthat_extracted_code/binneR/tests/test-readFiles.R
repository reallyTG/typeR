
context('readFiles')

test_that('readFiles works',{
	file <- list.files(system.file('mzML',package = 'binneR'),
										 full.names = TRUE)[1]
	
	res <- readFiles(file,dp = 2,scans = 6:17)

	expect_true(class(res) == 'list')
	expect_true(length(res) == 2)
	expect_true(identical(names(res),c('n','p')))
	expect_true(identical(purrr::map_dbl(res,ncol),c(n = 1639,p = 2748)))
	expect_true(identical(purrr::map_dbl(res,nrow),c(n = 1,p = 1)))
})