library(testthat)

context("utils.test data frame")

#################################################################################################
#################################################################################################
#################################################################################################

# data frame

#################################################################################################

test_that("test_returnValue_vector_data.frame_cellbycell ERROR compare-type",{
			
			expect_error(test_returnValue_data.frame_cellbycell(
							result = data.frame(x=c(1,2)),
							reference=data.frame(x=c(1,2)),
							add.desc="test_desc 123",
							xmlTestSpec=XML::xmlNode(
									"return-value",attrs=c("compare-type"="notype")
							)
					))
			
			
		})
test_that("test_returnValue_df compare-type tolerance work",{
			
			global_reporter <- get_reporter()
			
			my_reporter <- ListReporter$new()
			
			set_reporter(my_reporter)
			
			RTest:::test_returnValue_data.frame_cellbycell(
					result = data.frame(x=c(1,2)),
					reference=data.frame(x=c(1,2)),
					xmlTestSpec=NULL
			)
			
			my_reporter$end_reporter()
			set_reporter(global_reporter)
			
			for(i in 1:7){				
				expect_equal(
						class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
						"expectation_success"
				)
			}
			
		})

test_that("test_returnValue_df compare-type tolerance each column",{
			
			global_reporter <- get_reporter()
			
			my_reporter <- ListReporter$new()
			
			set_reporter(my_reporter)
			
			RTest:::test_returnValue_data.frame_cellbycell(
					result = data.frame(x=c(1,2.01),y=c(1.01,2.01)),
					reference=data.frame(x=as.integer(c(1,2)),y=c(1,2)),
					xmlTestSpec=XML::xmlNode(
							"return-value",attrs=c(
									"compare-type"="equal",
									"diff-type"="absolute",
									tolerance=1E-1),
							XML::xmlNode(
									"column",
									attrs=c(
											name="y",
											"compare-type"="equal",
											"diff-type"="absolute",
											tolerance=0)
									)
					)
			)
			
			my_reporter$end_reporter()
			set_reporter(global_reporter)
			
			for(i in 1:10){				
				if(i==10 || i==8){
					expect_equal(
							class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
							"expectation_failure"
					)
				}else{
					expect_equal(
							class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
							"expectation_success"
					)
				}
			}
			
		})
		
test_that("test_returnValue_df factor",{
					
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c("a","b"),y=c("a","b")),
			reference=data.frame(x=c("a","b"),y=c("a","b")),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="equal",
							"diff-type"="absolute",
							tolerance=1E-1)
				
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){				
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

test_that("test_returnValue_df integer",{
			
			global_reporter <- get_reporter()
			
			my_reporter <- ListReporter$new()
			
			set_reporter(my_reporter)
			
			RTest:::test_returnValue_data.frame_cellbycell(
					result = data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
					reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
					xmlTestSpec=XML::xmlNode(
							"return-value",attrs=c(
									"compare-type"="equal",
									"diff-type"="absolute",
									tolerance=1E-1)
					
					)
			)
			
			my_reporter$end_reporter()
			set_reporter(global_reporter)
			
			for(i in 1:10){				
				expect_equal(
						class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
						"expectation_success"
				)
			}
			
		})

test_that("test_returnValue_df integer absolute_as_numeric",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c("1","2"),y=c(1,2)),
			reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="equal",
							"diff-type"="absolute_as_numeric",
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){				
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

###-------------- Less than

test_that("test_returnValue_df more_than",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c(1.01,2.01),y=c(1.01,2.01)),
			reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="more_than",
							"diff-type"="relative",
							tolerance=1E-3)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){				
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

test_that("test_returnValue_df more_than failed",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c(1.0,2.01),y=c(1.01,2.01)),
			reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="more_than",
							"diff-type"="relative",
							tolerance=1E-3)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){		
		if(i==7){
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_failure"
			)
			
		}else{
			
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
		}
	}
	
})

test_that("test_returnValue_df less_than failed",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c(1.0,1.99),y=c(0.99,1.99)),
			reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="less_than",
							"diff-type"="relative",
							tolerance=1E-3)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){		
		if(i==7){
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_failure"
			)
			
		}else{
			
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_success"
			)
		}
	}
	
})


test_that("test_returnValue_df less_than success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c(0.9,1.99),y=c(0.99,1.99)),
			reference= data.frame(x=as.integer(c(1,2)),y=as.integer(c(1,2))),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="less_than",
							"diff-type"="relative",
							tolerance=1E-3)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){		
			
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_success"
			)
	}
	
})

test_that("test_returnValue_df regex success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c("aba","bab"),y=c("aba","bab")),
			reference=data.frame(x=c("[a|b]{1,3}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}")),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){				
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})


test_that("test_returnValue_df regex failed",{
	
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_cellbycell(
			result = data.frame(x=c("aba","bab"),y=c("aba","bab")),
			reference=data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}")),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:10){		
		if(i==7){
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_failure"
			)
			
		}else{
			
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_success"
			)
		}
	}
	
})

#--------------------- SHAPE
#
#
test_that("test_returnValue_df_shape success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_shape(
			result = data.frame(x=c("aba","bab"),y=c("aba","bab")),
			reference=data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}")),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							"check_rownames"=FALSE,
							"check_colnames"=FALSE,
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})
test_that("test_returnValue_df_shape success add",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	RTest:::test_returnValue_data.frame_shape(
			result = data.frame(x=c("aba","bab"),y=c("aba","bab")),
			reference=data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}")),
			xmlTestSpec=NULL,
			add.desc="XX"
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

test_that("test_returnValue_df_shape row names failure",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	result_data <- data.frame(x=c("aba","bab"),y=c("aba","bab"))
	row.names(result_data) <- c("one","two")
	
	RTest:::test_returnValue_data.frame_shape(
			result = result_data,
			reference = data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}")),
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							"check_rownames"=TRUE,
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	for(i in 3:4){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_failure"
		)
	}
	
})


test_that("test_returnValue_df_shape row names success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	result_data <- data.frame(x=c("aba","bab"),y=c("aba","bab"))
	row.names(result_data) <- c("one","two")
	reference_data <- data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}"))
	row.names(reference_data) <- c("one","two")
	RTest:::test_returnValue_data.frame_shape(
			result = result_data,
			reference = reference_data,
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							"check_rownames"=TRUE,
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	for(i in 3:4){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

test_that("test_returnValue_df_shape col names success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	result_data <- data.frame(x=c("aba","bab"),y=c("aba","bab"))
	row.names(result_data) <- c("one","two")
	reference_data <- data.frame(x=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}"))
	row.names(reference_data) <- c("one","two")
	RTest:::test_returnValue_data.frame_shape(
			result = result_data,
			reference = reference_data,
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							"check_rownames"=TRUE,
							"check_colnames"="TRUE",
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	for(i in 3:4){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	for(i in 5:6){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})

test_that("test_returnValue_df_shape col names success",{
			
	global_reporter <- get_reporter()
	
	my_reporter <- ListReporter$new()
	
	set_reporter(my_reporter)
	
	result_data <- data.frame(x=c("aba","bab"),y=c("aba","bab"))
	row.names(result_data) <- c("one","two")
	reference_data <- data.frame(abc=c("[a|b]{4}","[a|b]{1,3}"),y=c("[a|b]{1,3}","[a|b]{1,3}"))
	row.names(reference_data) <- c("one","two")
	RTest:::test_returnValue_data.frame_shape(
			result = result_data,
			reference = reference_data,
			xmlTestSpec=XML::xmlNode(
					"return-value",attrs=c(
							"compare-type"="regex",
							"diff-type"="absolute",
							"check_rownames"=TRUE,
							"check_colnames"="TRUE",
							tolerance=1E-1)
			
			)
	)
	
	my_reporter$end_reporter()
	set_reporter(global_reporter)
	
	for(i in 1:2){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	for(i in 3:4){		
		if(i==3){
			
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_failure"
			)
		}else{
			
			expect_equal(
					class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
					"expectation_success"
			)
		}
	}
	for(i in 5:6){		
		
		expect_equal(
				class(my_reporter$results$as_list()[[1]]$results[[i]])[1],
				"expectation_success"
		)
	}
	
})