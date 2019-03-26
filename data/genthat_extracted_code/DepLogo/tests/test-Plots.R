context("Plots")

test_that("low-level",{
	
	seqs<-read.table(system.file("extdata", "cjun.txt", package = "DepLogo"),stringsAsFactors = FALSE)
	data<-DLData(sequences = seqs[,1], weights = log( seqs[,2]+1 ) )
	
	plot(0)
	expect_equal(deprects(data,0),-length(data))
	expect_equal(colorchart(data,0),-length(data))
	expect_equal(logo(data,0),-length(data))
})


test_that("Deplogo",{
	seqs<-read.table(system.file("extdata", "cjun.txt", package = "DepLogo"),stringsAsFactors = FALSE)
	data<-DLData(sequences = seqs[,1], weights = log( seqs[,2]+1 ) )
	
	silent<-plotDeplogo(data,threshold = 0.3)
	expect_equal(length(silent),1)
	expect_equal(length(silent[[1]]),2)
	expect_type(silent,"list")
	expect_type(silent[[1]],"list")
	expect_s3_class(silent[[1]][[1]],"DLData")
})


