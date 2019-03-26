library(RTest)


### Name: xmlReadData_text
### Title: Read XML Data From Type 'xmlReadData_text' as R Variable
### Aliases: xmlReadData_text

### ** Examples

data <- '<variable type="character">My text is awesome</variable>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_text(item)
stopifnot(value=="My text is awesome")



