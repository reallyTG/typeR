library(RTest)


### Name: RTestCase
### Title: Constructor for RTestCase
### Aliases: RTestCase

### ** Examples

library(RTest)

xml.root <- XML::newXMLNode("func01")
RTest::xmlFromList(xml.root,
		list(
				params=list(mult=list(attributes=c(value="1",type="numeric"))),
				testspec=list(
execution=list(attributes=c("execution-type"="silent")),
"return-value"=list(attributes=c(
"compare-type"="equal",
"diff-type"="absolute",
"tolerance"=0.001
))
				)			
		)
)	
# Add the reference result to the params and testspec and read it in again
xml.root <- XML::xmlRoot(XML::xmlTreeParse(
				paste0("<root>",
						capture_output(print(xml.root[[1]])),
						capture_output(print(xml.root[[2]])),
						paste(xmlWriteData_data.frame(
										"reference",
	                  data=data.frame(x=c(1,1),y=c(2,2),sum=c(3,3)),
										printXML=FALSE)
								,collapse="\n"),"</root>")
		))

# Define what to test in the first test
# Please check the function test.RTest.funct_01 to see
# how it tests the code of the function ("test_fun")
tests <- new.env()
testEntry <- list(
		"pkg"            = "RTest",                  # test description
		"pgk-iter"       = "1",
		"func"           = "funct_01",
		"func-iter"      = "1",
		"test-code"      = "RTest::test_fun",
		"test-adapter"   = "RTestCase",
		"test-func"      = "test.RTest.funct_01",
		"pkg-desc"       = "no package desc",
		"func-desc"      = "Simple add func",
		"xpath"          = "/root",
		"reporter"       = NA,   # field for testthat reporter
		"result"         = NA,   # field for test result (failed/success)
		"cache"          = NA,   # field for caching test results
		"execresid"      = NA,	 # field for test execution result id
		"specid"         = "0",	 # field for test function id
		"riskid"         = "0"	 # field for test function risk id
)

# Assign test entry to test environment 
#      pkg-name  pkg-iter    func-name  func-iter
tests[["RTest"]][["1"]][["funct_01"]][["1"]] <- testEntry

# Create a TestCase Object
object <- RTestCase(
		ID="1",
		tc.type="RTestCase",
		synopsis= list(version="v1",author="Sebastian Wolf"),
		xml.fPath="",
		xml.root=xml.root,
		input.data=list("one"=
						data.frame(x=c(1,1),y=c(2,2))
		),
		tests=tests,
		test.for="RTest",
		test.result=NA
)

# Run the test
object <- test(object,test.for="RTest")
stopifnot(object@test.result=="success")

# Run a failing test

object@input.data <- list("one"=
				data.frame(x=c(1,2),y=c(2,1))
)
object <- test(object,test.for="RTest")
stopifnot(object@test.result=="failed")




