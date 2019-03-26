context("Filter")

test_that("Filter by gaps",{
	seqs<-c("ACG","AC-")
	data<-DLData(seqs,symbols = c("A","C","G","T","-"), colors = 1:5)
	expect_equal(dim(filterColumns(data,filter.by.gaps(0.6))$data),c(2,4))
	expect_equal(dim(filterColumns(data,filter.by.gaps(0.4))$data),c(2,3))
	expect_equal(filterColumns(data,filter.by.gaps(0.4))$axis.labels,c(1,2))
})


test_that("Filter by conservation",{
	seqs<-c("ACG","AA-")
	data<-DLData(seqs,symbols = c("A","C","G","T","-"), colors = 1:5)
	expect_equal(dim(filterColumns(data,filter.by.conservation(0.6))$data),c(2,3))
	expect_equal(filterColumns(data,filter.by.conservation(0.6))$axis.labels,c(2,3))
})


test_that("Filter by dependencies",{
	seqs<-c("ACG","AA-")
	data<-DLData(seqs,symbols = c("A","C","G","T","-"), colors = 1:5)
	expect_equal(dim(filterColumns(data,filter.by.dependencies(0.1))$data),c(2,3))
	expect_equal(filterColumns(data,filter.by.dependencies(0.1))$axis.labels,c(2,3))
})

test_that("Filter error",{
	seqs<-c("ACG","AA-")
	data<-DLData(seqs,symbols = c("A","C","G","T","-"), colors = 1:5)
	expect_error(filterColumns(data,filter.by.dependencies(0.3)),"No column matched the filter criteria")
})