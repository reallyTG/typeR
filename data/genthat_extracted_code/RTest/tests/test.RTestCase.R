context("RTestCase")

# Check that an empty RTestCase can be initialized
test_that("RTestCase initialize",{
			
			expect_equal(		
					RTestCase(
							ID                = "TC01",
							tc.type           = "mytest" ,
							synopsis          = list(),
							input.data        = list(one=data.frame(x=c(1,2))),
							tests             = new.env(),
							test.for          = "mypackage",
							test.result       = NULL,
							xml.fPath = "",
							xml.root = XML::xmlNode("empty")
					) %>% class() %>% as.character(),"RTestCase")
			expect_equal(		
					RTestCase(
							ID                = "TC01",
							tc.type           = "mytest" ,
							synopsis          = list(),
							input.data        = list(one=data.frame(x=c(1,2))),
							tests             = new.env(),
							test.for          = "mypackage",
							test.result       = NULL,
							xml.fPath = "",
							xml.root = XML::xmlNode("empty")
					) %>% RTest:::getXMLRoot(),XML::xmlNode("empty"))
			expect_equal(		
					RTestCase(
							ID                = "TC01",
							tc.type           = "mytest" ,
							synopsis          = list(),
							input.data        = list(one=data.frame(x=c(1,2))),
							tests             = new.env(),
							test.for          = "mypackage",
							test.result       = NULL,
							xml.fPath = "",
							xml.root = XML::xmlNode("empty")
					) %>% RTest:::getTestFor(),"mypackage")
			expect_equal(		
					RTestCase(
							ID                = "TC01",
							tc.type           = "mytest" ,
							synopsis          = list(),
							input.data        = list(one=data.frame(x=c(1,2))),
							tests             = new.env(),
							test.for          = "mypackage",
							test.result       = NULL,
							xml.fPath = "",
							xml.root = XML::xmlNode("empty")
					) %>% RTest:::getExecDetails.html(),c())
			expect_silent(
					RTestCase(
							xml.fPath = file.path(
									find.package("RTest"),
									"xml-templates/RTest_medium.xml"
									)
							)
					)
		})

context("large test case")

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
			xml.dPath = paste0(find.package("RTest"),"/xml-templates"),
			f.pattern="test.large.xml")
	
	outf <- tempfile(fileext=".html")
	
	testCollection <- exec(testCollection, out.fPath = tempfile(), open=FALSE)
	
	set_reporter(global_rep)
	
	expect_error(
			execAdapter(
					testCollection@collection[[1]],"RTest", 1, "funct_012", tf.func.i = 1))
	
	expect_equal(
			testCollection@collection[[1]]@tests[["RTest"]][[1]]$example_list_large[[1]]$result,
			"failed"
	)
})