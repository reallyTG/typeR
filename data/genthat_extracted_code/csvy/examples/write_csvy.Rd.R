library(csvy)


### Name: write_csvy
### Title: Export CSVY data
### Aliases: write_csvy

### ** Examples

library("datasets")
write_csvy(head(iris))

# write yaml w/o comment charaters
write_csvy(head(iris), comment_header = FALSE)




