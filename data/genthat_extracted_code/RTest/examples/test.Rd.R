library(RTest)


### Name: test
### Title: Execute Test Logic of the Test Case
### Aliases: test test,RTestCase-method

### ** Examples


location <- find.package("RTest")

TestCase <- RTestCase(xml.fPath = 
	file.path(location,"xml-templates","RTest_TC-01.xml"))

result <- test(TestCase)

stopifnot(result@test.result == "success")
 



