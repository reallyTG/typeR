context("DLData")

test_that("DLData without weights",{
	seqs<-c("ACG","ACA")
	data<-DLData(seqs)
	expect_s3_class(object = data, "DLData")
	expect_equal(data$data$weights,c(1,1))
	expect_equal(as.character(data$data[1,1]),"A")
	expect_equal(data$sortByWeights,FALSE)
	expect_equal(data$alphabet$chars,c("A","C","G","T"))
	expect_equal(dim(data),c(2,4))
	expect_equal(length(data),2)
})

test_that("DLData with weights",{
	seqs<-c("ACG","GCA")
	weights<-c(1,2)
	data<-DLData(sequences = seqs,weights = weights)
	expect_equal(data$data$weights,c(2,1))
	expect_equal(as.character(data$data[1,1]),"G")
	expect_equal(data$sortByWeights,TRUE)
	expect_equal(data$alphabet$chars,c("A","C","G","T"))
	expect_equal(dim(data),c(2,4))
	
	data<-DLData(sequences = seqs,weights = weights,sortByWeights = FALSE)
	expect_equal(data$data$weights,c(1,2))
	expect_equal(as.character(data$data[1,1]),"A")
	expect_equal(data$sortByWeights,FALSE)
	expect_equal(data$alphabet$chars,c("A","C","G","T"))
	expect_equal(dim(data),c(2,4))
})

test_that("DLData alphabet, color",{
	al<-c("A","B")
	seqs<-c("AAB","BBA")
	data<-DLData(sequences = seqs,symbols = al,colors = 1:2)
	expect_equal(data$alphabet$chars,al)
	
	expect_error(DLData(seqs,symbols=al,colors=1:3))
	
	seqs<-c("ABC","AAB")
	expect_error(DLData(seqs))
	
	expect_error(DLData(seqs,symbols=al,colors=1:2))
	
})

test_that("DLData summary",{
	seqs<-read.table(system.file("extdata", "cjun.txt", package = "DepLogo"),stringsAsFactors = FALSE)
	data<-DLData(sequences = seqs[,1], weights = log1p( seqs[,2] ) )
	li <- summary(data)
	
	expect_equal(li$members,nrow(data$data))
	expect_equal(li$consensus,"GGGGGATGAGTCATCGGTGG")
	expect_equal(li$equals.consensus,0)
	
	data$data <- data$data[,11:15]
	li <- summary(data)
	
	expect_equal(li$members,nrow(data$data))
	expect_equal(li$consensus,"TCATC")
	expect_equal(li$equals.consensus,1971)
	
	li <- partition(data)
	df<-summary(li)
	
	expect_equal(df$members,nrow(data$data))
	expect_equal(df$consensus,"TCATC")
	expect_equal(df$equals.consensus,1971)
	
})


