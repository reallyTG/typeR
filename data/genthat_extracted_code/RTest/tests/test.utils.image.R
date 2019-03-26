library(testthat)

#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------

#test_returnValue_variable 
context("utils.test image")

# Test that the
test_that("test_image_compare not using equal",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_image(
			result = 
					file.path(
							find.package("RTest"),
							"images/Roche_Logo.png"
					),
			reference=file.path(
					find.package("RTest"),
					"images/Roche_Logo.png"
			),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c("compare-type"="less_than",
							"tolerance"=0
					)
			),
			add.desc = "mydesc"
	)
	
	my_reporter$end_reporter()
	
	
	set_reporter(global_reporter)
	
	expect_equal(
			class(my_reporter$results$as_list()[[1]]$results[[1]])[1],
			"expectation_error"
	)
		
	
})

# Test that the image comparison works with factors
test_that("test_image_compare using factors as inputs",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_image(
			result = 
					as.factor(file.path(
							find.package("RTest"),
							"images/Roche_Logo.png"
					)),
			reference=as.factor(file.path(
					find.package("RTest"),
					"images/Roche_Logo.png"
			)),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c("compare-type"="equal",
							"tolerance"=0
					)
			),
			add.desc = "mydesc"
	)
	
	my_reporter$end_reporter()
	
	
	set_reporter(global_reporter)
	
	expect_equal(
			class(my_reporter$results$as_list()[[1]]$results[[1]])[1],
			"expectation_success"
	)
		
	
})
