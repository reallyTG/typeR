context("Dependencies")

test_that("Dependencies max",{
	
	seqs<-c("ACGT","AGCT");
	data<-DLData(seqs)
	deps<-getDeps(data)
	mat<-matrix(0,nrow=4,ncol=4)
	mat[3,2]<-mat[2,3]<-log(2)*2
	expect_equal(deps,mat)
})


test_that("Dependencies min",{
	seqs<-c("AC","TC","CC","GC")
	data<-DLData(seqs)
	deps<-getDeps(data)
	expect_equal(deps,matrix(0,nrow = 2,ncol = 2))
})


test_that("Dependencies mid",{
	seqs<-c("AC","TC","CG","GG")
	data<-DLData(seqs)
	deps<-getDeps(data)
	expect_equal(deps,matrix(c(0,4*log(2),4*log(2),0),nrow = 2))
})