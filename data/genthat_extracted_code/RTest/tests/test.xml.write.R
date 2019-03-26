library(testthat)

context("XMLWrite context")

test_that("RTest:::xmlWrite_context",{
			
			expect_output(
					regexp = "\\/MyCase",
					RTest:::xmlWriteContext("MyCase", "01", opening = TRUE, closing = TRUE,
					xsd.scheme = NULL, printXML = TRUE)
			)
			expect_output(
					regexp = "scheme1",
					RTest:::xmlWriteContext("MyCase", "01", opening = TRUE, closing = TRUE,
					xsd.scheme = "scheme1", printXML = TRUE)
			)
			expect_error(
					
					RTest:::xmlWriteContext(id= "01", opening = TRUE, closing = TRUE,
							xsd.scheme = "scheme1", printXML = TRUE)
					)
			expect_error(
					
					RTest:::xmlWriteContext(TCType= "01", opening = TRUE, closing = TRUE,
							xsd.scheme = "scheme1", printXML = TRUE)
					)
			expect_silent(
					RTest:::xmlWriteContext("MyCase", "01", opening = TRUE, closing = TRUE,
							xsd.scheme = NULL, printXML = F)
					)
		})

###################################################################################################

# Synopsis

###################################################################################################

test_that("RTest:::xmlWrite_synopsis",{
			expect_error(
					
					RTest:::xmlWriteSynopsis(author="ab")
			)
			expect_error(
					
					RTest:::xmlWriteSynopsis(version="ab")
			)
			expect_output(regexp = "fliesstext",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),description="fliesstext")
			)
			expect_output(regexp = "author.{1}du.{2}author",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"))
			)
			expect_output(regexp = "meintext",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),shortDescription="meintext")
			)
			expect_output(regexp = "short\\-description",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),shortDescription="meintext")
			)
			expect_output(regexp = "label",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),label="affenstart")
			)
			expect_output(regexp = "affenstart",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),label="affenstart")
			)
			expect_output(regexp = "affenstart",
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),creationDate="affenstart")
			)
			changes <- list(
					list(author = "ich", date = "2018-01", desc = "Initial Version"),
					list(author = "du", date = "2018-02", desc = "zweite Version"))
			expect_output(
					
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),label="affenstart",changes=changes),
					regexp = "change\\-history"
			)
			expect_silent(
					RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),label="affenstart",changes=changes,printXML=F)
			
			)
			expect_equal(
					class(RTest:::xmlWriteSynopsis(version="01",author=c("ich","du"),description="fliesstext",printXML=F))
					,"character")
	
})


###################################################################################################

# input_data

###################################################################################################


test_that("xmlWriteInputData",{
			expect_output(
					regexp = "abc",
					
					RTest:::xmlWriteInputData("abc",printXML=T)
					)
			expect_output(
					regexp = "input\\-data",
					
					RTest:::xmlWriteInputData("abc",printXML=T)
					)
			expect_silent(
					RTest:::xmlWriteInputData("abc",printXML=F)
					)
			expect_equal(
					RTest:::xmlWriteInputData(printXML=F),
					c("<input-data>","</input-data>")
					)
		})

###################################################################################################

# tests

###################################################################################################
test_that("xmlWriteInputData",{
	
			expect_output(
					regexp="tests",
					
					RTest:::xmlWriteTests()
					)
			expect_silent(
					RTest:::xmlWriteTests("abc",printXML=F)
					)
		})

###################################################################################################

# test single

###################################################################################################

test_that("xmlWriteTest",{
			expect_error(
					
					RTest:::xmlWriteTest(testdesc = NA)
					)
			expect_error(
					RTest:::xmlWriteTest(elemname="eleme",testdesc = 1)
					)
			expect_output(
					regexp = "elem",
					RTest:::xmlWriteTest(elemname="eleme")
					)
			expect_silent(
					RTest:::xmlWriteTest(elemname="eleme",printXML=F)
					)
		})

###################################################################################################

# test function

###################################################################################################


test_that("xmlWriteTestFunction",{
			expect_error(
					RTest:::xmlWriteTestFunction()
			)
			
			expect_error(
					RTest:::xmlWriteTestFunction(elemname="elem",testdesc=1)
			)
			
			expect_error(
					RTest:::xmlWriteTestFunction(elemname="elem",execresid=1)
			)
			expect_output(
					regexp = "exec\\-res\\-id",					
					RTest:::xmlWriteTestFunction(elemname="elem",execresid="1")
					)
					
			#specid
			expect_error(
					RTest:::xmlWriteTestFunction(elemname="elem",specid=1)
			)
			
			expect_output(
					regexp = "spec\\-id",					
					RTest:::xmlWriteTestFunction(elemname="elem",specid="1")
					)
			# riskid		
			expect_error(
					RTest:::xmlWriteTestFunction(elemname="elem",riskid=1)
			)
			
			expect_output(
					regexp = "risk\\-id",					
					RTest:::xmlWriteTestFunction(elemname="elem",riskid="1")
					)
			# TC
			expect_equal(c(
							"<elem>","<params>","1","</params>","<reference>",
							"<variable value='1'>","</reference>","<testspec>",
							"<expec />",
							"</testspec>",
							"</elem>"
					
					),
					trimws(unname(RTest:::xmlWriteTestFunction("elem",
											params=list(param1=1),
											reference="<variable value='1'>",
											printXML=F,
											testspec = "<expec />"
									)))
			)
			# TC without testspec
			expect_equal(c(
							"<elem>","<params>","1","</params>","<reference>",
							"<variable value='1'>","</reference>",
							"<testspec />",
							"</elem>"
					
					),
					trimws(unname(RTest:::xmlWriteTestFunction("elem",
											params=list(param1=1),
											reference="<variable value='1'>",
											printXML=F
									)))
			)
			
			expect_silent(
					RTest:::xmlWriteTestFunction(elemname="elem",riskid="1",printXML=F)
			)
		})

###################################################################################################
		
# xmlWriteTestSpec
		
###################################################################################################
		

test_that("xmlWriteTestSpec",{
			
			expect_output(
					regexp = "NA",
					RTest:::xmlWriteTestSpec(NA)
			)
			expect_output(
					regexp = "testspec",
					RTest:::xmlWriteTestSpec()
			)
			expect_output(
					regexp = "elem",
					RTest:::xmlWriteTestSpec(elemname="elem")
			)
			expect_silent(
					RTest:::xmlWriteTestSpec(elemname="elem",printXML=F)
			)
		})
###################################################################################################

# xmlWriteData_data.frame

###################################################################################################


test_that("xmlWriteData_data.frame",{
			expect_error(
					RTest:::xmlWriteData_data.frame()
					)
					
			expect_error(
					RTest:::xmlWriteData_data.frame(data=NULL)
			)
			
			expect_output(
					regexp="factor",
					RTest:::xmlWriteData_data.frame(data=data.frame(
							"a" = c("a","b"),
							"b" = as.integer(c(1,2)),
							"c" = c(1.1,1.2)
							)
					)
					)
			expect_output(
					regexp="character",
					RTest:::xmlWriteData_data.frame(data=data.frame(
							"a" = c("<a>","b"),
							"b" = as.integer(c(1,2)),
							"c" = c(1.1,1.2),
							stringsAsFactors = F
							)
					
					)
			)
			expect_equal(
					"<coldef name=\"a\" type=\"character\" />",
					trimws(RTest:::xmlWriteData_data.frame(data=data.frame(
									"a" = c("a","b"),
									"b" = as.integer(c(1,2)),
									"c" = c(1.1,1.2),
									stringsAsFactors = F
							),printXML=F
					
					))[3]
					
					)
			expect_equal(
					"<cell>1.2</cell>",
					trimws(RTest:::xmlWriteData_data.frame(data=data.frame(
									"a" = c("a","b"),
									"b" = as.integer(c(1,2)),
									"c" = c(1.1,1.2),
									stringsAsFactors = F
							),printXML=F
					
					))[15]
					
					)
			
		})
###################################################################################################
		
# xmlWriteData_vector
		
###################################################################################################
		
test_that("xmlWriteData_vector",{
			expect_error(
					RTest:::xmlWriteData_vector(data=as.factor(c("a","b")))
					)
			
			expect_output(
					regexp = "name\\=",
					RTest:::xmlWriteData_vector(data=c("a","b"),name="one")
					)
			expect_silent(
					RTest:::xmlWriteData_vector(data=c("a","b"),name="one",printXML=F)
					)
			expect_equal(
					c(
							"<vector name=\"one\" type=\"character\">",
							"<element>a</element>"     ,               
							"<element>b</element>"      ,              
							"</vector>" 	
							
							
							),
					trimws(RTest:::xmlWriteData_vector(data=c("a","b"),name="one",printXML=F))
					
					)
})

###################################################################################################

# xmlWriteData_variable

###################################################################################################

test_that("xmlWriteData_variable",{
			expect_equal(
					"<variable value=\"\" type=\"NULL\"/>",
					RTest:::xmlWriteData_variable(data=NULL,printXML=F)
			)
			expect_equal(
			"<variable value=\"\" type=\"NULL\" name=\"1\"/>",
			RTest:::xmlWriteData_variable(data=NULL,printXML=F, name=1)
			)
			expect_equal(
					"<variable value=\"123.938324662\" type=\"numeric\" name=\"1\"/>",
					RTest:::xmlWriteData_variable(printXML=F, name=1,data=123.938324662)
			)
			expect_output(
					RTest:::xmlWriteData_variable(printXML=T, name=1,data=123.938324662)
					)
		})

###################################################################################################

# xmlWriteData_list

###################################################################################################

test_that("xmlWriteData_list",{
			
			test_list <- list(
					
					a = 123,
					x = c("1","2"),
					y = data.frame(x=c("1","2"),y=c(1,2)),
					z = list(
							z1 = c("1","2")
							)
					
					)
			expect_output(
					RTest:::xmlWriteData_list(data=test_list,name="mylist",printXML=T)
			)
			
			expect_equal(
					
					c( "<list name=\"mylist\">"   ,                            
							"<variable value=\"123\" type=\"numeric\" name=\"a\"/>",
							"<vector name=\"x\" type=\"character\">"               ,
							"<element>1</element>"                                 ,
							"<element>2</element>"                                 ,
							"</vector>"                                            ,
							"<data name=\"y\">"                                    ,
							"<col-defs>"                                           ,
							"<coldef name=\"x\" type=\"factor\" />"                ,
							"<coldef name=\"y\" type=\"numeric\" />"               ,
							"</col-defs>"                                          ,
							"<row name=\"1\">"                                     ,
							"<cell>1</cell>"                                       ,
							"<cell>1</cell>"                                       ,
							"</row>"                                               ,
							"<row name=\"2\">"                                     ,
							"<cell>2</cell>"                                       ,
							"<cell>2</cell>"                                       ,
							"</row>"                                               ,
							"</data>"                                              ,
							"<list name=\"z\">"                                    ,
							"<vector name=\"z1\" type=\"character\">"              ,
							"<element>1</element>"                                 ,
							"<element>2</element>"                                 ,
							"</vector>"                                            ,
							"</list >"                                             ,
							"</list >" ),
					trimws(strsplit(
									RTest:::xmlWriteData_list(
											data=test_list,name="mylist",printXML=F),
									"\n")[[1]])
			
			)
		
		})

###################################################################################################
		
# xmlWriteTest_execution
		
###################################################################################################
		
		
test_that("xmlWriteTest_execution",{
			expect_error(
					
					RTest:::xmlWriteTest_execution(executionType="xx")	
					)
			expect_silent(
					RTest:::xmlWriteTest_execution(printXML=F)	
					
					)
			expect_output(
					RTest:::xmlWriteTest_execution(printXML=T)	
					
					)
})

###################################################################################################
		
# xmlWriteTest_variable
		
###################################################################################################

test_that("xmlWriteTest_variable",{
			expect_silent(
					
					RTest:::xmlWriteTest_variable(printXML=F)
					)
			expect_output(
					
					RTest:::xmlWriteTest_variable(printXML=T)
					)
		})

###################################################################################################
		
# xmlWriteTest_vector
		
###################################################################################################

test_that("xmlWriteTest_vector_elementbyelement",{
			expect_silent(
					
					RTest:::xmlWriteTest_vector_elementbyelement(printXML=F)
					)
			expect_output(
					
					RTest:::xmlWriteTest_vector_elementbyelement(printXML=T)
					)
			expect_output(
					regexp = "relative",
					RTest:::xmlWriteTest_vector_elementbyelement(printXML=T,
						data=c("1"=1.0,"2"=2.0),
						tolerance=c("1"=1E-2,"2"=1E-3),
						test = c("1"="absolute","2"="relative")
						)
					)
					#no names
			expect_output(
					regexp = "relative",
					RTest:::xmlWriteTest_vector_elementbyelement(printXML=T,
						data=c(1,2),
						tolerance=c("1"=1E-2,"2"=1E-3),
						test = c("1"="absolute","2"="relative")
						)
					)
		})

###################################################################################################

# xmlWriteTest_data.frame

###################################################################################################


test_that("xmlWriteTest_data.frame_cellbycell",{

	expect_error(
			RTest:::xmlWriteTest_data.frame_cellbycell(data=c("a"))
			)
	expect_output(
			RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame())
			)	
	expect_output(
			regexp = "relative",
			RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame("a"=c(1,2),b=c(1,2)),
					tolerance=c("a"=1E-2,"b"=1E-3),
					diff_type = c("a"="absolute","b"="relative")
					)
			)	
	expect_equal(
			"<column name = \"a\"/>",
			trimws(RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame("a"=c(1,2),b=c(1,2)),
					tolerance=c("a"=1E-2,"b"=1E-3),
					diff_type = c("a"="absolute","b"="relative"),
					printXML=F
					)[2])
			)	
	# naming of inputs
	expect_error(
			regexp = "diff_type",
			trimws(RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame("a"=c(1,2),b=c(1,2)),
					tolerance=c("a"=1E-2,"b"=1E-3),
					diff_type = c("a"="absolute","ba"="relative"),
					printXML=F
					)[2])
			)	
	expect_error(
			regexp = "tolerance",
			trimws(RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame("a"=c(1,2),b=c(1,2)),
					tolerance=c("a"=1E-2,"ab"=1E-3),
					diff_type = c("a"="absolute","b"="relative"),
					printXML=F
					)[2])
			)	
	# comptype
	expect_error(
			RTest:::xmlWriteTest_data.frame_cellbycell(data=data.frame("a"=c(1,2),b=c(1,2)),
					tolerance=c("a"=1E-2,"b"=1E-3),
					compare_type = c("a"="less_than","b"="less_than")
					)
			)	
	
})


###################################################################################################

# xmlWriteTest_list_nodebynode

###################################################################################################


test_that("xmlWriteTest_list_nodebynode",{
			expect_output(
					regexp = "desc\\=\"list_",					
					RTest:::xmlWriteTest_list_nodebynode(
					
					)
			)
			# tolerance
			expect_output(
					regexp = "\"b\"\\stolerance",
					RTest:::xmlWriteTest_list_nodebynode(
							data=list("a"=1,"b"=2),
							tolerance = c("a"=1E-2,"b"=1E-3)
					)
			)
			expect_error(
					regexp = "tolerance",
					RTest:::xmlWriteTest_list_nodebynode(
							data=list("a"=1,"ab"=2),
							tolerance = c("a"=1E-2,"b"=1E-3)
					)
			)
			# test
			expect_output(
					regexp = "\"b\"\\sdiff",
					RTest:::xmlWriteTest_list_nodebynode(
							data=list("a"=1,"b"=2),
							test = c("a"="absolute","b"="relative")
					)
			)
			expect_error(
					regexp = "test",
					RTest:::xmlWriteTest_list_nodebynode(
							data=list("a"=1,"ab"=2),
							test = c("a"=1E-2,"b"=1E-3)
					)
			)
			# no names
			expect_output(
					regexp = "diff-type",
					RTest:::xmlWriteTest_list_nodebynode(
							data=list(1,2),
							test = c("1"=1E-2,"2"=1E-3)
					)
			)
			expect_silent(
					RTest:::xmlWriteTest_list_nodebynode(
							data=list(1,2),
							test = c("1"=1E-2,"2"=1E-3),
							printXML=F
					)
			)
			
		})