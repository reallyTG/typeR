library(RTest)


### Name: xmlReadData_vector
### Title: Read XML Data From Type 'xmlReadData_vector' as R Vector
### Aliases: xmlReadData_vector

### ** Examples

data <- '<testvector type="numeric"><element>1</element><element>2</element></testvector>'
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_vector(item)
print("2 shall be the outcome")
print(length(value))



