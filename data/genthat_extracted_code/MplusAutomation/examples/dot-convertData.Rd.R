library(MplusAutomation)


### Name: .convertData
### Title: Convert a matrix or data frame to numeric or integer for Mplus
### Aliases: .convertData
### Keywords: internal

### ** Examples


## Not run: 
##D df1 <- df2 <- df3 <- df4 <- mtcars
##D 
##D df2$cyl <- factor(df2$cyl)
##D df2$am <- as.logical(df2$am)
##D 
##D df3$mpg <- as.character(df3$mpg)
##D 
##D df4$vs <- as.Date(df4$vs, origin = "1989-01-01")
##D 
##D df5 <- as.matrix(cars)
##D 
##D df6 <- matrix(c(TRUE, TRUE, FALSE, FALSE), ncol = 2)
##D 
##D df7 <- as.list(mtcars)
##D 
##D 
##D MplusAutomation:::.convertData(df1)
##D 
##D MplusAutomation:::.convertData(df2)
##D 
##D MplusAutomation:::.convertData(df3)
##D 
##D MplusAutomation:::.convertData(df4)
##D 
##D MplusAutomation:::.convertData(df5)
##D 
##D MplusAutomation:::.convertData(df6)
##D 
##D MplusAutomation:::.convertData(df7)
##D 
##D rm(df1, df2, df3, df4, df5, df6, df7)
## End(Not run)



