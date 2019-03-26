
context('detectInfusionScans')

test_that('detectInfusionScans works',{
	file <- list.files(system.file('mzML',package = 'binneR'),
										 full.names = TRUE)[1]
	
	scans <- detectInfusionScans(file)
	
	expect_true(class(scans) == 'integer')
	expect_true(identical(scans,as.integer(c(6:18))))
})