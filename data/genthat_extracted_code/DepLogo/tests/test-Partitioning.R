context("Partitioning")

test_that("Partitioning",{
	
	seqs<-read.table(system.file("extdata", "cjun.txt", package = "DepLogo"),stringsAsFactors = FALSE)
	data<-DLData(sequences = seqs[,1], weights = log1p( seqs[,2] ) )
	
	parts<-partition(data,threshold = 0,minElements = 1000)
	expect_equal(length(parts),5)
	
	for(el in parts){
		expect_gte(length(el),1000)
	}
	
	df<-summary(parts)
	
	expect_equal(df$members,c(1682, 1245, 1860, 1901, 1920))
	expect_equal(df$consensus,c("GGGGATGACGTCATCGGCGC", "GGGGGATGAGTCATCTGTTT", "GGGGGATGAGTCATCCATGG", "GGGGGATGAGTCATAGGGGG", "CAGGGATGAGTCATCAGTGC"))
	expect_equal(df$equals.consensus,c(0,0,0,0,0))
	
	parts<-partition(data,threshold = 0,minElements = length(data))
	expect_equal(length(parts),1)
	
	parts<-partition(data,threshold = 0, maxNum = 1,minElements = 1)
	expect_lte(length(parts),16)
	
	parts<-partition(data)
	num<-apply(parts[[1]]$data,2,function(a){length(unique(a))})
	expect(min(num),1)
})