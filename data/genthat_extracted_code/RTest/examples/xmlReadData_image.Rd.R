library(RTest)


### Name: xmlReadData_image
### Title: Read XML Data From Type 'xmlReadData_image' as R Variable
### Aliases: xmlReadData_image

### ** Examples

location <- find.package("RTest")
data <- paste0(
		'<variable name="myvar" value="',location,
          '/images/Roche_Logo.png" type="character" image="TRUE"/>'
		)
item <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
value <- RTest::xmlReadData_image(item)
stopifnot(grepl("png",value$address))




