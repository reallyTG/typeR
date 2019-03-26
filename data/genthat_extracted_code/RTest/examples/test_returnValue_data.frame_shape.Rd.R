library(RTest)


### Name: test_returnValue_data.frame_shape
### Title: Tests a Standard R 'data.frame' by shape, rownames and colnames
###   ('RTestTest_data.frame_shape')
### Aliases: test_returnValue_data.frame_shape

### ** Examples

# Cleaning up

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)

# create some definition of tests

data <- '<test_df desc="Compare a value" diff-type="relative" 
         compare-type="equal" tolerance="1E-6"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

# Create data frames

x <- data.frame(x=c(1,2,3,4),y=c(1,2,3,4))
y <- data.frame(x=c(1,2,3,4),y=c(1,2,3,4))
y_wrong_shape <- data.frame(x=c(1,2,3,4,5),y=c(1,2,3,4,5))
y_wrong_names <- data.frame(x=c(1,2,3,4),y1=c(1,2,3,4))

test_returnValue_data.frame_shape(x,y,xmlTestSpec)

# Test for shape

tryCatch(
		{test_returnValue_data.frame_shape(x,y_wrong_shape,xmlTestSpec)
		stop("test did not find difference")},
		error=function(e){
			stopifnot(grepl("rec.nrows",e))
			stopifnot(grepl("exp.nrows",e))
			stopifnot(grepl("not equal",e))
		})

# Test for column names

data <- '<test_df check_colnames="TRUE" 
          desc="Compare a value" diff-type="relative" 
          compare-type="equal" tolerance="1E-6"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))

tryCatch({
		test_returnValue_data.frame_shape(x,y_wrong_names,xmlTestSpec)
		stop("test did not find difference")},
     error=function(e){
			stopifnot(grepl("rec.name",e))
			stopifnot(grepl("exp.name",e))
			stopifnot(grepl("not equal",e))
		})




