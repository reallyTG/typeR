library(RTest)


### Name: exec
### Title: Tests imported Test Cases
### Aliases: exec exec,RTestCollection-method

### ** Examples


testCollection <- new("RTestCollection",
	project.name    = "RTest Vignette", 
	project.details = "Example test exectuion",
	tester          = "Example tester",
	test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))

TCDir <- list.dirs(find.package("RTest"),recursive = TRUE) %>% 
   grep(pattern = "xml-templates", value = TRUE)

message("Test Adapter being used is defined in Function")
message("test.RTest.test_returnValue_data.frame_cellbycell")

testCollection <- RTest::importTCsFromDir(testCollection,
		xml.dPath = TCDir,f.pattern	= "RTest_TC-01.xml")

testCollection <- exec(testCollection)

outf <- tempfile(fileext=".html")
writeExecSummary.html(testCollection, out.fPath = outf,open = FALSE)

stopifnot(any(grepl("passed",readLines(outf))))




