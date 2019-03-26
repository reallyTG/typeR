library(RTest)


### Name: test_returnValue_image
### Title: Tests an image file with ImageMagick ('RTestTest_image')
### Aliases: test_returnValue_image

### ** Examples


# Cleaning up

tryCatch(unloadNamespace("RTest"))
tryCatch(unloadNamespace("testthat"))
library(RTest)

# create some definition of tests

data <- '<test_image desc="Compare a value" diff-type="relative" 
         compare-type="equal" tolerance="0"/>'
xmlTestSpec <- XML::xmlRoot(XML::xmlParse(data,asText=TRUE))
location <- find.package("RTest")

# Create a test with equal images

result <- paste0(location,"/images/Roche_Logo.png")
reference <- paste0(location,"/images/Roche_Logo.png")

test_returnValue_image(result,reference,xmlTestSpec)

 # Create a test with images that are not equal

reference <- paste0(location,"/images/Roche_Logo_defect.png")
tryCatch(
	test_returnValue_image(result,reference,xmlTestSpec),
	error=function(e){
		if(!grepl("not equal to",e)){
			stop("image omparison defect, please check code")
		}
	})
	



