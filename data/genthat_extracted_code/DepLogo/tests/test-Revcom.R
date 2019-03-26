context("Revcom")

test_that("Revcom, DNA",{
	data<-DLData(c("ACGT","ATTA"))
	data2<-revcom(data)
	expect_equal(as.character(data2$data[,1]),c("A","T"))
	expect_equal(as.character(data2$data[,2]),c("C","A"))
	expect_equal(data,revcom(revcom(data)))
})

test_that("Revcom, RNA, gaps",{
	data<-DLData(c("-CGU","AUUA"),symbols = c("A","C","G","U","-"),colors = c("green","blue","orange","red","grey"))
	data2<-revcom(data)
	expect_equal(as.character(data2$data[,1]),c("A","U"))
	expect_equal(as.character(data2$data[,2]),c("C","A"))
	expect_equal(as.character(data2$data[,4]),c("-","U"))
	expect_equal(data,revcom(revcom(data)))
})