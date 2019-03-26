library(RTest)


### Name: xmlReadData_variable
### Title: Read XML Data From Type 'xmlReadData_variable' as R Variable
### Aliases: xmlReadData_variable

### ** Examples

data <- '<variable name="myvar" value="4" type="numeric"/>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_variable(item)
print("5 shall be the outcome")
print(value + 1)



