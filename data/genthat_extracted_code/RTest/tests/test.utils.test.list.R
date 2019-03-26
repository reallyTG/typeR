library(testthat)

#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------

#test_returnValue_variable 
context("utils.test list")

test_that("test_returnValue_list",{
			
			global_reporter <- get_reporter()
			
			my_reporter <- ListReporter$new()
			
			set_reporter(my_reporter)
			
			RTest:::test_returnValue_list_nodebynode(result =list(
							a = c("a","b","c"),
							d = data.frame(x=c(1,2)),
							f = list(
									e = c("a","b","c")
							)
					),
					reference=list(
							a = c("a","b","c"),
							d = data.frame(x=c(1,2)),
							f = list(
									e = c("a","b","c")
									)
							),
					xmlTestSpec=NULL
					)
			
			my_reporter$end_reporter()
			set_reporter(global_reporter)
			
			for(i in 1:4){
				
				expect_equal(
						class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
						"expectation_success"
				)
				
			}
			
		})

test_that("test_returnValue_list falure",{
			
	expect_error(test_returnValue_list_nodebynode(
			result = list("My friends are great."),
			reference= list("fr[i|e]{3}"),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c("compare-type"="notype")
			)
	))
	
	
})

test_that("test_returnValue_list",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_list_nodebynode(result =list(
					a = c("a","b","c"),
					d = data.frame(x=c(1,2)),
					f = list(
							e = c("a","b","c")
					),
					z=1
			),
			reference=list(
					a = c("a","b","c"),
					d = data.frame(x=c(1,2)),
					f = list(
							e = c("a","b","c")
					),
					z=1
			),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="equal",
							"diff-type"="absolute",
							tolerance=1E-1),
					XML::xmlNode(
							"elem",
							attrs=c(
									name="z",
									"compare-type"="equal",
									"diff-type"="absolute",
									tolerance=0)
					)
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:5){
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
		
	}
	
})

test_that("test_returnValue_list wrong element class",{
			ref <- list("Abc")
			class(ref) <- "abc"
	expect_error(test_returnValue_list_nodebynode(
					result = list("My friends are great."),
					reference= list(ref),
					xmlTestSpec=XML::xmlNode(
							"return-value",attrs=c("compare-type"="notype")
					)
			))
	
})

test_that("test_returnValue_list single element NULL",{
			
		global_reporter <- get_reporter()
		
		my_reporter <- ListReporter$new()
		
		set_reporter(my_reporter)
		
		RTest:::test_returnValue_list_nodebynode(result =list(
						a = c("a","b","c"),
						d = data.frame(x=c(1,2)),
						f = list(
								e = c("a","b","c")
						),
						my_ref = NULL
				),
				reference=list(
						a = c("a","b","c"),
						d = data.frame(x=c(1,2)),
						f = list(
								e = c("a","b","c")
						),
						my_ref=1
				),
				xmlTestSpec=XML::xmlNode(
						"return-value",attrs=c(
								"compare-type"="equal",
								"diff-type"="absolute",
								tolerance=1E-1),
						XML::xmlNode(
								"elem",
								attrs=c(
										name="z",
										"compare-type"="equal",
										"diff-type"="absolute",
										tolerance=0)
						)
				)
		)
		
		my_reporter$end_reporter()
		set_reporter(global_reporter)
		
		for(i in 1:length(my_reporter$results$as_list())){
			if(i==6){
				
				expect_equal(
						class(my_reporter$results$as_list()[[i]]$results[[1]])[1],
						"expectation_failure"
				)
			}else{
				for(g in 1:length(my_reporter$results$as_list()[[i]]$results)){
					
					expect_equal(
							class(my_reporter$results$as_list()[[i]]$results[[g]])[1],
							"expectation_success"
					)
				}
			}
			
		}
		
	})
	
test_that("test_returnValue_list single image",{
			
		global_reporter <- get_reporter()
		
		my_reporter <- ListReporter$new()
		
		set_reporter(my_reporter)
		
		RTest:::test_returnValue_list_nodebynode(result =list(
						a = c("a","b","c"),
						d = data.frame(x=c(1,2)),
						f = list(
								e = c("a","b","c")
						),
						my_ref = list(image=T,
								address = file.path(
										find.package("RTest"),
										"images/Roche_Logo.png"
								)
						)
				),
				reference=list(
						a = c("a","b","c"),
						d = data.frame(x=c(1,2)),
						f = list(
								e = c("a","b","c")
						),
						my_ref=list(image=T,
								address = file.path(
										find.package("RTest"),
										"images/Roche_Logo.png"
								)
						)
				),
				xmlTestSpec=XML::xmlNode(
						"return-value",attrs=c(
								"compare-type"="equal",
								"diff-type"="absolute",
								tolerance=1E-1),
						XML::xmlNode(
								"elem",
								attrs=c(
										name="z",
										"compare-type"="equal",
										"diff-type"="absolute",
										tolerance=0)
						)
				)
		)
		
		my_reporter$end_reporter()
		set_reporter(global_reporter)
		
		for(i in 1:length(my_reporter$results$as_list())){
				for(g in 1:length(my_reporter$results$as_list()[[i]]$results)){
					
					expect_equal(
							class(my_reporter$results$as_list()[[i]]$results[[g]])[1],
							"expectation_success"
					)
				}
			
		}
		
	})