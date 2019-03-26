library(testthat)

context("RTestCollection")

test_that("RTestCollection show",{
	
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
	
	intern_reporter <- get_reporter()
	
	set_reporter(global_rep)
	
	expect_output(regexp = "Example\\stester",
			show(testCollection)
	)

})

test_that("RTestCollection importTC errors",{
	
	global_rep <- get_reporter()
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			
		testCollection <- importTC(testCollection,xml.fPath = NULL)
			)
	expect_error(
			
		testCollection <- importTC(testCollection)
			)
			
	expect_error(
			
		testCollection <- importTC(testCollection,xml.fPath = "C:/abcdkdf")
			)

	
	expect_silent(testCollection <- importTC(testCollection,
			xml.fPath = file.path(find.package("RTest"),
					"xml-templates/RTest_TC-01.xml"
					)
			))
			
	file.copy(
			from =  file.path(find.package("RTest"),
					"xml-templates/RTest_TC-01.xml"
			)
			,to= file.path(find.package("RTest"),
					"xml-templates/RTest_TC-Error_01.xml"
			)
	)
	set_reporter(global_rep)
	expect_error(
			
		testCollection <- importTC(testCollection,
				xml.fPath = file.path(find.package("RTest"),
						"xml-templates/RTest_TC-Error_01.xml"
						)
				)
	)
	
	file.remove(file.path(find.package("RTest"),
					"xml-templates/RTest_TC-Error_01.xml"
			))
	
	
})


test_that("RTestCollection importTCsFromDir errors",{
			
	global_rep <- get_reporter()
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			
			testCollection <- importTCsFromDir(testCollection, xml.dPath = NULL)
	)
	expect_error(
			
			testCollection <- importTCsFromDir(testCollection)
	)
	expect_error(
			testCollection <- importTCsFromDir(testCollection,xml.dPath = "C:/abcdkdf")
	)
	
	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/RTest_TC-01.xml"
					)
			))
	set_reporter(global_rep)
})

test_that("RTestCollection getTC errors",{
			
	global_rep <- get_reporter()
	
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			getExecStates(testCollection)
	)
	
	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/RTest_TC-01.xml"
					)
			))
	set_reporter(global_rep)
	expect_error(
			getTC(testCollection))
	expect_error(
			getTC(testCollection,NULL))
	expect_equal(
			getTC(testCollection,"RTest_TC-02"),NULL)
	expect_equal(
			as.character(class(getTC(testCollection,"RTest_TC-01"))),"RTestCase")
		
	
})

test_that("RTestCollection summary errors / successes",{
			
	global_rep <- get_reporter()
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			
			summary(testCollection)
	)
	
	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/RTest_TC-01.xml"
					)
			))
	set_reporter(global_rep)
	expect_error(
			summary(testCollection))
	
	# Execute Test Case
	set_reporter(intern_reporter)
	testCollection <- exec(testCollection, out.fPath = tempfile(), open=FALSE)
	set_reporter(global_rep)
	
	expect_output(
			regexp = "success",
			summary(testCollection)
			)
})

test_that("RTestCollection write HTML summary",{
			
	global_rep <- get_reporter()
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			
			writeExecSummary.html(testCollection)
	)
	expect_error(
			
			writeExecSummary.html(testCollection, out.fPath = tempfile(fileext=".html"),open=F)
	)
	
	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/RTest_TC-01.xml"
					)
			))
	set_reporter(global_rep)
	expect_silent(
			
			writeExecSummary.html(testCollection, out.fPath = tempfile(fileext=".html"),open=F)
	)
	
	# Execute Test Case
	set_reporter(intern_reporter)
	testCollection <- exec(testCollection, out.fPath = tempfile(fileext=".html"), open=FALSE)
	set_reporter(global_rep)
	
	expect_silent(
			writeExecSummary.html(testCollection,
					out.fPath = tempfile(fileext=".html"),
					logo= file.path(find.package("RTest"),
							"images/Roche_Logo_defect.png"
					),
					open=FALSE
			)
	)
})

test_that("RTestCollection getRTM",{
			
	global_rep <- get_reporter()
	# Create test collection
	testCollection <- new("RTestCollection", 
			project.name    = "RTest Vignette", 
			project.details = "Example test exectuion",
			tester          = "Example tester",
			test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))
	intern_reporter <- get_reporter()
	set_reporter(global_rep)
	
	expect_error(
			getRTM(testCollection)
	)
	expect_error(getRTMInMatrixShape(testCollection))

	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/RTest_TC-01.xml"
					)
			))
	set_reporter(global_rep)
	# Simple RTM
	rtm_result <- t(matrix(data.frame(
							"ID"="RTest_TC-01",
							"Version"="01",
							"Type"="RTestCase",
							"sDesc"="RTest Template TC",
							"SpecIDs"="",
							"RiskIDs"=""
							,stringsAsFactors = F
					)))
	colnames(rtm_result) <- c("ID","Version","Type","sDesc","SpecIDs","RiskIDs")
	
	expect_equal(
			rtm_result,
			getRTM(testCollection)
			)
	expect_silent(testCollection <- importTC(testCollection,
					xml.fPath = file.path(find.package("RTest"),
							"xml-templates/test.RTM.xml"
					)
			))
	
	# Nicely shaped RTM
	new_rtm <- data.frame(
			"SpecIDs"=c("RTest:2","3;secondpackage:1"),
			"RTest_TC-01"=c("",""),
			"RTest_TC-03"=c("x","x"),
			stringsAsFactors = F,check.names = F)
	
	row.names(new_rtm) <- c("RTest:2","3;secondpackage:1")
	
	expect_equal(new_rtm,
			getRTMInMatrixShape(testCollection))
})
