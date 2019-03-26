library(RTest)


### Name: test_execution
### Title: Tests Silent Execution of an Function
### Aliases: test_execution

### ** Examples

value <- test_execution(
      "sum",
      list(x=2,y=3),
      xmlTestSpec=XML::xmlNode(
          name="execution",
          attrs=list('execution-type'="silent"))
)
stopifnot(value==5)

# Create a function that always produces warnings

sum_test <- function(...){
	warning("test")
	sum(...)
}

# Let this function run and crash, if it crashes check if the error contains "produced warnings"

tryCatch(
test_execution(
   "sum_test",
    list(x=2,y=3),
   xmlTestSpec=XML::xmlNode(name="execution",attrs=list("execution-type"="silent"))
 ),error=function(e){
    stopifnot(grepl("produced warnings",e))
 })



