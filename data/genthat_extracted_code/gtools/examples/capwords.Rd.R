library(gtools)


### Name: capwords
### Title: Capitalize Words for Titles
### Aliases: capwords
### Keywords: utilites character

### ** Examples

capwords("a function to capitalize words in a title")
capwords("a function to capitalize words in a title", AP=FALSE)

capwords("testing the iProduct for defects")
capwords("testing the iProduct for defects", strict=TRUE)
capwords("testing the iProduct for defects", onlyfirst=TRUE)
capwords("testing the iProduct for defects", preserveMixed=TRUE)

capwords("title_using_underscores_as_separators", sep="_")




