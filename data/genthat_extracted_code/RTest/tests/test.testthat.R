context("testthat functionalities replacements")

my_reporter <- function(){
	
	global_rep <- get_reporter()
	
	# Try to get the output of expect_silent_RTest
	reporter     <- ListReporter$new()
	
	set_reporter(reporter)
	reporter$start_reporter()
	
	# Execute the wrapper function
	tmpExec <- NULL
	
	with_reporter(reporter, 
			test_that("length computed correctly", {
						expect_silent_RTest(message("xx"))
					})
	)
	reporter$end_context()
	reporter$end_reporter()
	
	set_reporter(global_rep)
	
	return(reporter)
}

test_that("expect_silent_RTest function works", {
			
			b <- 1
			
			expect_error(as.logical(expect_silent_RTest(a <- c_value)))
			
			expect_equal(as.logical(expect_silent_RTest(a <- b)),TRUE)
			
			reporter <- my_reporter()
			
			expect_equal(
					reporter$results$as_list()[[1]]$results[[1]]$message,
					"`message(\"xx\")` produced:\nmessages = 'xx'")
		})


my_reporter <- function(){
	global_rep <- get_reporter()
	# Try to get the output of expect_silent_RTest
	reporter     <- ListReporter$new()
	set_reporter(reporter)
	reporter$start_reporter()
	
	# Execute the wrapper function
	tmpExec <- NULL
	myfun <- function(){
		warning("one")
		warning("two")
	}
	with_reporter(reporter, 
			test_that("length computed correctly", {
						RTest::expect_silent_RTest(myfun())
					})
	)
	reporter$end_context()
	reporter$end_reporter()
	set_reporter(global_rep)
	return(reporter)
}

test_that("expect_silent_RTest function warnings works", {
			
			reporter <- my_reporter()
			
			expect_equal(
					reporter$results$as_list()[[1]]$results[[1]]$message,
					"`myfun()` produced:\nwarnings1 = 'one'\nwarnings2 = 'two'")
			
		})

test_that("expect_silent_RTest function warnings works with own quasi comp", {
			
			options("force_implementation"=TRUE)
			
			reporter <- my_reporter()
			
			expect_equal(
					reporter$results$as_list()[[1]]$results[[1]]$message,
					"`myfun()` produced:\nwarnings1 = 'one'\nwarnings2 = 'two'")
			
			options("force_implementation"=FALSE)
			
		})

test_that("expect_silent_RTest function outptus works", {
			
			global_rep <- get_reporter()
			# Try to get the output of expect_silent_RTest
			reporter     <- ListReporter$new()
			
			set_reporter(reporter)
			reporter$start_reporter()
			
			# Execute the wrapper function
			tmpExec <- NULL
			myfun <- function(){
				print("one")
				print("two")
			}
			with_reporter(reporter, 
					test_that("length computed correctly", {
								expect_silent_RTest(myfun())
							})
			)
			reporter$end_context()
			reporter$end_reporter()
			set_reporter(global_rep)
			expect_equal(
					reporter$results$as_list()[[1]]$results[[1]]$message,
					"`myfun()` produced:\noutputs = '[1] \"one\"\n[1] \"two\"'")
		})



test_that("exec_silent_RTest in reporting works",{
			
			global_rep <- get_reporter()
			# Create test collection
			testCollection <- new("RTestCollection", 
					project.name    = "RTest Vignette", 
					project.details = "Example test exectuion",
					tester          = "Example tester",
					test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
			
			testCollection <- importTCsFromDir(testCollection,
					xml.dPath = paste0(find.package("RTest"),"/xml-templates"),
					f.pattern="test.testthat.xml")
			
			outf <- tempfile(fileext=".html")
			
			intern_reporter <- get_reporter()
			
			set_reporter(intern_reporter)
			# Execute all tests with two warnings
			my_fun <<- function(){
				warning("one")
				warning("two")
			}
			testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)
			
			set_reporter(global_rep)
			
			expect_equal(
					testCollection@collection[[1]]@tests[["RTest"]][[1]][[1]][[1]]$result,
					"failed"
			)
			# Just one warning
			my_fun <<- function(){
				warning("one")
			}
			testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)
			
			set_reporter(global_rep)
			
			expect_equal(
					testCollection@collection[[1]]@tests[["RTest"]][[1]][[1]][[1]]$result,
					"failed"
			)
			
		})
		
test_that("expectation logical",{
	expect_equal(
	class(as.expectation.logical(TRUE,message="mymes",info="addon")),
	c("expectation_success","expectation","condition")
			
			)	
	expect_equal(
			as.expectation.logical(TRUE,message="mymes",info="addon")$message,
			"mymes\naddon"
			)
		})

#............................. Greater LOWER ................................................

test_that("expect_less_than",{
			
			expect_silent(
					RTest:::expect_less_than(5,5.1)
					)
			expect_error(
					RTest:::expect_less_than(5,4.9)
					
					)
		})
test_that("expect_more_than",{
			options("force_implementation"=NULL)
			
			expect_silent(
					RTest:::expect_more_than(5,4.9)
					)
			expect_error(
					RTest:::expect_more_than(5,5.1)
					)
		})

test_that("expect_more_than old testthat",{
			options("force_implementation"=TRUE)
			
			expect_warning(
			
					RTest:::expect_gt(5,4.9)
					)
			options("force_implementation"=FALSE)
		})

test_that("expect_less_than old testthat",{
			options("force_implementation"=TRUE)
			
			expect_warning(
			
					RTest:::expect_lt(5,5.1)
					)
			options("force_implementation"=FALSE)
		})

