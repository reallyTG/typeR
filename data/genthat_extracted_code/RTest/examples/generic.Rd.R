library(RTest)


### Name: generic
### Title: Generic test adapter Method
### Aliases: generic generic,RTestCase-method

### ** Examples

options("RTest_verbose" = TRUE)

testCollection <- new("RTestCollection", 
		project.name    = "RTest Vignette", 
		project.details = "Example test exectuion",
		tester          = "Example tester",
		test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))

TCDir <- paste0(find.package("RTest"),"/xml-templates")

testCollection <- RTest::importTCsFromDir(testCollection,
		xml.dPath = TCDir,f.pattern	= "RTest_TC-02.xml")


outf <- tempfile(fileext=".html")

funct_02 <- function(data, mult) {   cbind(data, "sum" = apply(data, 1, sum)*mult) }
environment(funct_02) <- asNamespace('RTest')

testCollection <- RTest::exec(testCollection, out.fPath = outf, open=FALSE)




