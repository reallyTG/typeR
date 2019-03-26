###################################################################################################
#                                                                                                 #
# Author:         Sebastian Wolf								                                  #
#                                                                                                 #
###################################################################################################

library(testthat)
library(RTest)

context("Risk tracibility matrix")

test_that("getRTMInfos single package",{
			
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
					f.pattern="test.execCache.xml")
			
			set_reporter(global_rep)

			expect_equal(
					RTest:::getRTMInfos(
					testCollection@collection[[1]]),
					list(
							ID="RTest_TC-04",
							Version="01",
							Type="RTestCase",
							sDesc="RTest Template TC",
							SpecIDs="2, 3",
							RiskIDs="1"
							)
					
					)
		})

test_that("getRTMInfos",{
			
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
					f.pattern="test.RTM.xml")
			
			set_reporter(global_rep)
			
			expect_equal(
					RTest:::getRTMInfos(
					testCollection@collection[[1]]),
					list(
							ID="RTest_TC-03",
							Version="01",
							Type="RTestCase",
							sDesc="RTest Template TC",
							SpecIDs="RTest: 2, 3; secondpackage: 1",
							RiskIDs="RTest: 1; secondpackage: 2"
							)
					
					)
		})


