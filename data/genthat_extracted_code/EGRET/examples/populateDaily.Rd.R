library(EGRET)


### Name: populateDaily
### Title: Populate Daily data frame
### Aliases: populateDaily
### Keywords: WRTDS flow

### ** Examples

dateTime <- as.character(seq(as.Date("2001/1/1"), 
         as.Date("2001/12/31"), by = "day"))
value <- 1:365
code <- rep("",365)
dataInput <- data.frame(dateTime, value, code, stringsAsFactors=FALSE)
Daily <- populateDaily(dataInput, 2)



