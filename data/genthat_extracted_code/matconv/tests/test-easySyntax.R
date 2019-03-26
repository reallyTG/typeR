context("Easy syntax")

test_that("End within slicing gets replaced", {
	linesMat <- c("for(ca in commas(2:end))")
	res <- convSymbols(linesMat)
	expect_true(!is.na(match(res, "for(ca in commas(2:length(commas)))")))
	
	linesMat <- c("for(ca in commas(2:end)){")
	res <- convSymbols(linesMat)
	expect_true(!is.na(match(res, "for(ca in commas(2:length(commas))){")))
	
})

test_that("End to get the last element gets replaced", {
	
	linesMat <- c("thing{end}")
	res <- convSymbols(linesMat)
	expect_true(!is.na(match(res, "thing{length(thing)}")))
})

test_that("dot syntax gets replaced", {
	linesMat <- c("A.*B")
	res <- convDotSyntax(linesMat)
	expect_true(!is.na(match(res, "A*B")))
	
})

test_that("regular dots don't get replaced", {
	linesMat <- c("student.name")
	res <- convDotSyntax(linesMat)
	expect_true(!is.na(match(res, "student.name")))
	
	
})
