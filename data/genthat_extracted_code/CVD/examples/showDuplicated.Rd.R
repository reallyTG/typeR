library(CVD)


### Name: showDuplicated
### Title: Show missing and duplicated cap numbers
### Aliases: showDuplicated
### Keywords: programming

### ** Examples

# find duplicate values
## Not run: 
##D showDuplicated(1:15)
##D showDuplicated(c(1:4,8,5:14))
##D # this is an example of a typo in data from a publication
##D #Procedures for Testing Color Vision: Report of Working Group 41, 1981, 
##D Committee on Vision, National Research Council, pp. 107
##D #the "monochromat" data has "16" instead of "6"
##D data(exampleNRC1981)
##D showDuplicated(exampleNRC1981[,3])
## End(Not run)



