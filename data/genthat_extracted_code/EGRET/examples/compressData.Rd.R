library(EGRET)


### Name: compressData
### Title: Compress sample data frame
### Aliases: compressData
### Keywords: WRTDS flow

### ** Examples

dateTime <- c('1985-01-01', '1985-01-02', '1985-01-03')
comment1 <- c("","","")
value1 <- c(1,2,3)
comment2 <- c("","<","")
value2 <- c(2,3,4)
comment3 <- c("","","<")
value3 <- c(3,4,5)
dataInput <- data.frame(dateTime, comment1, value1, 
      comment2, value2, 
      comment3, value3, stringsAsFactors=FALSE)
compressData(dataInput)



