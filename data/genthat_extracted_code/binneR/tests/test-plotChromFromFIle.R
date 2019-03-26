
context('plotChromFromFile')

test_that('plotChromFromFile works',{
	pl <- plotChromFromFile(list.files(system.file('mzML',package = 'binneR'),
																		 full.names = TRUE)[1],scans = c(6,18))
	
	expect_true(identical(class(pl),c('gg','ggplot')))
})