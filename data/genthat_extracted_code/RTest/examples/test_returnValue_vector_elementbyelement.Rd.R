library(RTest)


### Name: test_returnValue_vector_elementbyelement
### Title: Tests a Standard R 'vector' Element-By-Element
###   ('RTestTest_vector_elementbyelement')
### Aliases: test_returnValue_vector_elementbyelement

### ** Examples


# Cleaning up

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)

data <- '<test_variable desc="Compare a value" diff-type="absolute" compare-type="equal"
				tolerance="1E-3"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

test_returnValue_vector_elementbyelement(c(5,5),c(5,5),xmlTestSpec)
test_returnValue_vector_elementbyelement(c(5,5),c(5,5.000001),xmlTestSpec)

data <- '<test_variable desc="Compare a value" diff-type="relative" compare-type="equal"
				tolerance="1E-6"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)

tryCatch(
		test_returnValue_vector_elementbyelement(c(5,5),c(5,5.0001),xmlTestSpec),
		error=function(e){
			stopifnot(grepl("5 not equal to 5.0001.",e))
 		})




