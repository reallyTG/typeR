
context('binneRlyse')

file <- list.files(system.file('mzML',package = 'binneR'),
									 full.names = TRUE)[1]

info <- tibble::tibble(fileOrder = 1,
											 injOrder = 1,
											 fileName = basename(file),
											 batch = 1,
											 block = 1,
											 name = '1',
											 class = 1)

p <- binParameters(scans = 6:17,nCores = 2,clusterType = 'PSOCK')

analysis <- binneRlyse(file, 
											 info, 
											 parameters = p)

inf <- info(analysis)
bd <- binnedData(analysis)
ad <- accurateData(analysis)

chrPl <- plotChromatogram(analysis)
ticPl <- plotTIC(analysis)
binPl <- plotBin(analysis,'n133.01')

test_that('binParameters works',{
	expect_true(class(p) == 'BinParameters')
	expect_true(identical(slotNames(p),c("scans","modes","sranges","cls","nCores","clusterType")))
	expect_true(identical(p@scans,6:17))
	expect_true(identical(p@modes,c('n','p')))
	expect_true(identical(p@sranges,list(c(70,1000))))
	expect_true(p@nCores == 2)
	expect_true(p@clusterType == 'PSOCK')
})

test_that('binneRlyse works',{
	expect_true(class(analysis) == 'Binalysis')
	
	expect_true(identical(class(inf),c('tbl_df','tbl','data.frame')))
	expect_true(nrow(inf) == 1)
	expect_true(ncol(inf) == 7)
	
	expect_true(class(bd) == 'list')
	expect_true(identical(names(bd),c('n','p')))
	expect_true(identical(purrr::map_dbl(bd,nrow),c(n = 1,p = 1)))
	expect_true(identical(purrr::map_dbl(bd,ncol),c(n = 687,p = 1237)))
	
	expect_true(identical(class(ad),c('tbl_df','tbl','data.frame')))
	expect_true(nrow(ad) == 1924)
	expect_true(ncol(ad) == 7)
})

test_that('plots work',{
	expect_true(identical(class(chrPl),c('gg','ggplot')))
	expect_true(identical(class(ticPl),c('gg','ggplot')))
	expect_true(identical(class(binPl),c('gg','ggplot')))
})