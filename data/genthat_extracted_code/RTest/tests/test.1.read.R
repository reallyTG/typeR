library(testthat)
library(RTest)

context("xmlReadData")

##################################################################################################


# NULL

##################################################################################################

test_that("xmlReadData NULL",
		{
			data <- '<variable name="myvar" value="4" type="numeric"/>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
 expect_equal(xmlReadData_variable(item),4)
 expect_equal(xmlReadData_variable(NULL),NULL)
 expect_equal(xmlReadData_vector(NULL),NULL)
 expect_equal(xmlReadData_data.frame(NULL),NULL)
 expect_equal(xmlReadData_list(NULL),NULL)
 expect_equal(xmlReadData_text(NULL),NULL)
 expect_equal(xmlReadData_to_list(NULL),list())

})
##################################################################################################


# VARIABLE

##################################################################################################

test_that("xmlReadData NA",
		{
			data <- '<variable name="myvar" value="" type="numeric"/>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
 expect_equal(xmlReadData_variable(item),vector("numeric"))

})

test_that("xmlReadData NA",
		{
			data <- '<variable name="myvar" value="NULL" type="numeric"/>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
 expect_equal(xmlReadData_variable(item),NULL)

})
##################################################################################################


# IMAGE

##################################################################################################
test_that("xmlReadData image",
		{
			location <- find.package("RTest")
			data <- paste0(
					'<variable name="myvar" value="',location,
					'/images/Roche_Logo.png" type="character" image="TRUE"/>'
			)
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			value <- xmlReadData_image(item)
			
			expect_equal(value$image,TRUE)
			#-------- Error as Image shall not exist
			data <- paste0(
					'<variable name="myvar" value="',location,
					'/images/Roche_LogoWRONG.png" type="character" image="TRUE"/>'
			)
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_error(
					xmlReadData_image(item)
					)
})

##################################################################################################


# VECTOR

##################################################################################################
test_that("xmlReadData vector",
		{
			data <- '<vector name="myvar">
				<elem name="name1">char1</elem><elem>char2</elem></vector>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_equal(
					xmlReadData_vector(item),
					c("name1"="char1","elem2"="char2")
			)
		})


##################################################################################################


# DATA FRAME

##################################################################################################

test_that("xmlReadData data frame",{
			
			data <- '<data.frame name="df1"><col-defs>
						<col-def name="col1" type="character"/>
						<col-def  type="character"/>
					</col-defs>
					<row name="1"><cell>NA</cell><cell>test</cell></row>
					</data.frame>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			int_df <- data.frame("col1"=c(""),"col2"="test",stringsAsFactors = FALSE)
			# Test Elements
			expect_equal(
					xmlReadData_data.frame(item,TRUE)[1,1],int_df[1,1]
			)
			expect_equal(
					xmlReadData_data.frame(item,TRUE)[1,2],int_df[1,2]
			)
			
			# Test Column naming
			expect_equal(
					names(xmlReadData_data.frame(item,TRUE))[2],"2"
					)
			
		})

test_that("xmlReadData data frame empty",{
			
			data <- '<data.frame name="df1"><col-defs>
						<col-def name="col1" type="character"/>
						<col-def  type="character"/>
					</col-defs>
					</data.frame>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			# Test to be df with 0 rows
			expect_equal(
					dim(xmlReadData_data.frame(item,FALSE)),c(0,2)
			)
			
			
		})
test_that("xmlReadData data frame types",{
			
			data <- '<data.frame name="df1"><col-defs>
						<col-def name="col1" type="character"/>
						<col-def type="integer"/>
						<col-def type="factor"/>
						<col-def type="logical"/>
					</col-defs>
					<row name="1">
						<cell>NA</cell>
						<cell>1</cell>
						<cell>abc</cell>
						<cell>TRUE</cell>
					</row>
					</data.frame>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			# Test to be df with 0 rows
			expect_equal(
					xmlReadData_data.frame(item,FALSE)[1,1],as.character(NA)
			)
			expect_equal(
					class(xmlReadData_data.frame(item,FALSE)[1,2]),"integer"
			)
			expect_equal(
					class(xmlReadData_data.frame(item,FALSE)[1,3]),"factor"
			)
			expect_equal(
					class(xmlReadData_data.frame(item,FALSE)[1,4]),"logical"
			)
			
			
		})

test_that("xmlReadData data frame error",{
			
			data <- '<data.frame name="df1"><col-defs>
						<col-def name="notype" type="notype"/>
					</col-defs>
					<row name="1">
						<cell>NA</cell>
					</row>
					</data.frame>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			# Test to be df with 0 rows
			expect_error(
					xmlReadData_data.frame(item,FALSE)
			)
		
			
			
		})

##################################################################################################


# TEXT

##################################################################################################

test_that("xmlReadData text",{
			
			data <- '<text type="character">All my fancy text</text>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_equal(
					xmlReadData_text(item),"All my fancy text"
			)
			
			
			data <- '<text type="numeric">NA</text>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_equal(
					xmlReadData_text(item),as.numeric(NA)
			)
			
			data <- '<text type="numeric"></text>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_equal(
					xmlReadData_text(item),vector("numeric")
			)
			
			data <- '<text type="numeric">NULL</text>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_equal(
					xmlReadData_text(item),NULL
			)
			
			
			
		})

#
##################################################################################################


# DEFAULT

##################################################################################################

test_that("xmlReadData default error",{
			
			data <- '<item><dummy type="character">All my fancy text</dummy></item>'
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
			expect_error(
					RTest:::xmlRead.default(item)
			)
			
		})

##################################################################################################


# TO LIST

##################################################################################################

test_that("xmlReadData toList",{
			location <- find.package("RTest")
			data <- paste0('<params>
				<text name="input1" type="character">MyText</text>',
				'<image name="myvar" value="',location,
					'/images/Roche_Logo.png" type="character" image="TRUE"/>'	,
					'<list name="islist">
<variable name="myvar1" value="1" type="numeric"/></list>',
							
			'</params>')
			item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
		
			expect_equal(
					xmlReadData_to_list(item)[["input1"]],"MyText")
			expect_equal(
					xmlReadData_to_list(item)[["image"]][["image"]],TRUE)
			expect_equal(
					xmlReadData_to_list(item)[["islist"]][["myvar1"]],1)
		})

