library(RTest)


### Name: test_returnValue_variable
### Title: Tests a Standard R 'variable' ('RTestTest_vector_variable')
### Aliases: test_returnValue_variable

### ** Examples


# Cleaning up

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)

data <- '<test_variable desc="Compare a value" 
          diff-type="absolute" compare-type="equal" tolerance="1E-3"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

test_returnValue_variable(5,5,xmlTestSpec)

test_returnValue_variable(5.0001,5,xmlTestSpec)

# Compare variable with a stricter tolerance

data <- '<test_variable desc="Compare a value" 
          diff-type="relative" compare-type="equal" tolerance="1E-6"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)
 
tryCatch(
		test_returnValue_variable(5.0001,5,xmlTestSpec),error=function(e){
			stopifnot(grepl("5.0001 not equal to 5.",e))
		})




