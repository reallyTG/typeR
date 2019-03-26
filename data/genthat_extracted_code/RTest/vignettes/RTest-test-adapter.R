## ---- eval = TRUE, echo = FALSE, out.width = "50%",fig.align="center"----
# All d efaults
knitr::include_graphics("test_fun.jpg",dpi=NA)

## ---- eval = TRUE, echo = TRUE-------------------------------------------
## Define the functions to be tested
test_fun <- function(dat, mult) {   cbind(dat, "sum" = apply(dat, 1, sum)*mult) }

# assign global to work inside vignette
assign("test_fun", test_fun, envir = .GlobalEnv)

## ---- eval = TRUE, echo = TRUE-------------------------------------------

my_data <- data.frame(x=c(1,2),y=c(1,2))

RTest::xmlWriteData_data.frame("data.frame",my_data,"test01")


## ---- eval = TRUE, echo = FALSE------------------------------------------
library(RTest)

## ---- eval = TRUE, echo = TRUE-------------------------------------------
# Create test adapter
setClass(
		Class          = "TestPackageTestCase",
		representation = representation(),
		prototype      = list(), 
		contains       = "RTestCase",
		where = .GlobalEnv
)

TestPackageTestCase <- function(xmlpath){
	RTestCase(xml.fPath=xmlpath)
}

RTest::setTestMethod(
		"test.Pkg_1.funct_01", 
		signature  = "TestPackageTestCase",
		definition = function(object, inputData, execCache, xmlDef, ...) {
			
			# Read parameters
			mult <- RTest::xmlReadData_variable(xmlDef[["params"]][["mult"]])
			
			
			# Calculate result
			result <- RTest::test_execution(
					what        = test_fun,
					args        = list(c(inputData[[1]], mult)),
					xmlTestSpec = xmlDef[["testspec"]][["execution"]])
			
			# Read reference
			reference <- RTest::xmlReadData_data.frame(xmlDef[["reference"]])
			
			# Execute test
			if(!is.null(xmlDef[["testspec"]][["return-value"]]))
				RTest::test_returnValue_data.frame_cellbycell(
						result, 
						reference, 
						xmlDef[["testspec"]][["return-value"]]
				)    
			
			
			# Return result (will be cached)
			return(result)
		},
		where = .GlobalEnv
)



## ---- eval = TRUE, echo = TRUE, message = FALSE--------------------------
# Create test collection
testCollection <- new("RTestCollection", 
		project.name    = "RTest Vignette", 
		project.details = "Example test exectuion",
		tester          = "Example tester",
		test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))

# Import TCs
TCDir <- paste0(find.package("RTest"),"/xml-templates")

testCollection <- importTCsFromDir(testCollection,
		xml.dPath = TCDir,f.pattern="RTest_TC-01.xml")


## ---- eval = TRUE, echo = TRUE, message = FALSE, warning=FALSE-----------
outf <- tempfile(fileext=".html")

# Execute test cases
testCollection <- exec(testCollection, out.fPath = outf, open=FALSE)

## ---- eval = TRUE, echo = FALSE------------------------------------------
# All defaults
knitr::include_graphics("report.jpg",dpi=NA)

