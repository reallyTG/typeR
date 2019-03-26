test_that("CompareVectors", {
a<-c(1, 2, 3, 4)
b<-c(1, 3, 3, 5)
result<-CompareVectors(a, b)
expect_equal(result$num, 2)
expect_equal(result$pos, c(2,4))
})

test_that("TranslateCodon", {
	codon.string="atg"
	numcode=1
	expect_equal("M", TranslateCodon(codon.string, numcode))
})

test_that("CreateAADistanceMatrix", {
	aa.distances <- CreateAADistanceMatrix()
	expect_equal(20, dim(aa.distances)[2])
	expect_equal(aa.distances[17,4], aa.distances[4,17]) #symmetry for distances
})

test_that("CodonNumericToString", {
	expect_equal(CodonNumericToString(3), "aag")
})

test_that("CodonStringToNumeric", {
	expect_equal(CodonStringToNumeric("aag"), 3)
})