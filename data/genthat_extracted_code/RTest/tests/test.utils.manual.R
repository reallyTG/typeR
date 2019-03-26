library(testthat)

#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------

#test_returnValue_variable 
context("utils.test manual")

test_that("test_manualCheck_file",{
	
	global_reporter <- get_reporter()
	
	# Just run manual tests on Travis CI
	if(Sys.getenv("TRAVIS")=="true" || as.character(Sys.info()["user"])=="travis"){
		my_reporter <- ListReporter$new()
	
		set_reporter(my_reporter)
	
		options("testmode" = TRUE)
	
		
		RTest:::test_manualCheck_file(result = 
						file.path(
								find.package("RTest"),
								"images/Roche_Logo.png"
								),
				reference=file.path(
						find.package("RTest"),
						"images/Roche_Logo.png"
				),
				xmlTestSpec=NULL,
				add.desc = "mydesc",
				openrecexp.exec = TRUE
		)
		
		my_reporter$end_reporter()
		
		options("testmode" = FALSE)
		
		set_reporter(global_reporter)
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[1]])[1],
				"expectation_success"
		)
	}
	
		
	
})


test_that("test_manualCheck_file non existing reference",{
	
	global_reporter <- get_reporter()
	
	if(Sys.getenv("TRAVIS")=="true" || as.character(Sys.info()["user"])=="travis"){
		my_reporter <- ListReporter$new()
	
		set_reporter(my_reporter)
	
		options("testmode" = TRUE)
	
		RTest:::test_manualCheck_file(result = 
						file.path(
								find.package("RTest"),
								"images/Roche_Logo.png"
								),
				reference=file.path(
						find.package("RTest"),
						"images/Roche_Logo_nonexist.png"
				),
				xmlTestSpec=NULL,
				add.desc = "mydesc",
				openrecexp.exec = TRUE
		)
		
		my_reporter$end_reporter()
		
		options("testmode" = FALSE)
		
		set_reporter(global_reporter)
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[1]])[1],
				"expectation_success"
		)
	}
	
})


test_that("test_manualCheck_file non existing result",{
			
	global_reporter <- get_reporter()
	
	# Just run manual tests on Travis CI
	if(Sys.getenv("TRAVIS")=="true" || as.character(Sys.info()["user"])=="travis"){
		my_reporter <- ListReporter$new()
		
		set_reporter(my_reporter)
		
		options("testmode" = TRUE)
		
		RTest:::test_manualCheck_file(result = 
						file.path(
								find.package("RTest"),
								"images/Roche_Logo_nonexit.png"
						),
				reference=file.path(
						find.package("RTest"),
						"images/Roche_Logo.png"
				),
				xmlTestSpec=NULL,
				add.desc = "mydesc",
				openrecexp.exec = TRUE
		)
		
		my_reporter$end_reporter()
		
		options("testmode" = FALSE)
		
		set_reporter(global_reporter)
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[1]])[1],
				"expectation_success"
		)
	}	
	
})