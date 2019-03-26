###################################################################################################
#                                                                                                 #
# Author:         Sebastian Wolf								                                  #
#                                                                                                 #
###################################################################################################

library(testthat)
library(RTest)


# - Create a test Adapter function that uses execCache
setTestMethod(
		"test.RTest.funct_02", 
		signature  = "RTestCase",
		definition = function(object, inputData, execCache, xmlDef, ...) {
			
			result <- execCache$funct_01[[1]]
			
			# Read reference
			reference <- xmlReadData_data.frame(xmlDef[["reference"]])
			
			# Execute test
			if(!is.null(xmlDef[["testspec"]][["return-value"]]))
				test_returnValue_data.frame_cellbycell(
						result, 
						reference, 
						xmlDef[["testspec"]][["return-value"]]
				)    
			
			
			# Return result (will be cached)
			return(result)
			
		})

# Create a Test Function without any tests to test
# the "NO-TESTs" functionalities
setTestMethod(
		"test.RTest.funct_03", 
		signature  = "RTestCase",
		definition = function(object, inputData, execCache, xmlDef, ...) {
			# Return result (will be cached)
			return(NULL)
			
		})

# Create a Test Function that just compares to 5
setTestMethod(
		"test.RTest.funct_04", 
		signature  = "RTestCase",
		definition = function(object, inputData, execCache, xmlDef, ...) {
			#result <- execCache$funct_01[[1]]
			#result <- execCache$funct_01[[1]]
			test_returnValue_variable(
					5, 
					xmlReadData_variable(xmlDef[["reference"]][[1]]), 
					xmlDef[["testspec"]][["return-value"]]
			)   
			# Return result (will be cached)
			return(NULL)
			
		})

context("execCache")
test_that("execCache",{
			
			global_rep <- get_reporter()
			
			# Create test collection
			testCollection <- new("RTestCollection", 
					project.name    = "RTest Vignette", 
					project.details = "Example test exectuion",
					tester          = "Example tester",
					test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
			
			# Import test cases from text.execCache.xml
			testCollection <- importTCsFromDir(testCollection,
					xml.dPath = paste0(find.package("RTest"),"/xml-templates"),f.pattern="test.execCache.xml")
			
			outf <- tempfile(fileext=".html")
			
			testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)
			
			set_reporter(global_rep)
			expect_error(
					execAdapter(
					testCollection@collection[[1]],"RTest", 1, "funct_012", tf.func.i = 1))
	
			expect_equal(
					testCollection@collection[[1]]@tests[["RTest"]][[1]]$funct_02[[1]]$result,
					"success"
			
			)
		})

test_that("execSummary",{
			
			global_rep <- get_reporter()
			# Create test collection
			testCollection <- new("RTestCollection", 
					project.name    = "RTest Vignette", 
					project.details = "Example test exectuion",
					tester          = "Example tester",
					test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
			
			testCollection <- importTCsFromDir(testCollection,
					xml.dPath = paste0(find.package("RTest"),"/xml-templates"),
					f.pattern="test.execCache.xml")
			
			outf <- tempfile(fileext=".html")
			
			intern_reporter <- get_reporter()
			
			set_reporter(global_rep)
			
			expect_error(
					RTest:::getExecSummary(
							testCollection@collection[[1]])
			)
			expect_equal(
					RTest:::getExecSummary.html(
							testCollection@collection[[1]]),c()
			)
			
			set_reporter(intern_reporter)
			# Execute all tests
			testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)

			set_reporter(global_rep)
			
			expect_output(
					RTest:::getExecSummary(
							testCollection@collection[[1]]),
					regexp = "'data.frame'\\:\\s2\\sobs.\\sof\\s{1,3}3\\svariables"
			)
			
		})


test_that("exec comparison less_than",{
			
			global_rep <- get_reporter()
			# Create test collection
			testCollection <- new("RTestCollection", 
					project.name    = "RTest Vignette", 
					project.details = "Example test exectuion",
					tester          = "Example tester",
					test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
			
			testCollection <- importTCsFromDir(testCollection,
					xml.dPath = paste0(find.package("RTest"),"/xml-templates"),
					f.pattern="test.execCache2.xml")
			
			outf <- tempfile(fileext=".html")
			
			# Execute all tests
			testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)
			
			set_reporter(global_rep)
			
			expect_output(
					RTest:::getExecSummary(
							testCollection@collection[[1]]),
					regexp = "success"
			)
			
		})
		
