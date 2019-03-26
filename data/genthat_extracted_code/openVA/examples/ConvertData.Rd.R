library(openVA)


### Name: ConvertData
### Title: Converting Input data with different coding scheme to standard
###   format
### Aliases: ConvertData

### ** Examples

## No test: 
# make up a fake 2 by 3 dataset with 2 deaths and 3 symptoms
id <- c("d1", "d2")
x <- matrix(c("Yes", "No", "Don't know", 
			  "Yes", "Refused to answer", "No"), 
			byrow = TRUE, nrow = 2, ncol = 3)
x <- cbind(id, x)
colnames(x) <- c("ID", "S1", "S2", "S3")
# see possible raw data (or existing data created for other purpose)
x
new <- ConvertData(x, yesLabel = "Yes", noLabel = "No", 
			missLabel = c("Don't know", "Refused to answer"))
new
## End(No test)



