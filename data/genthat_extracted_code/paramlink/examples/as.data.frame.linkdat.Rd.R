library(paramlink)


### Name: as.data.frame.linkdat
### Title: linkdat to data.frame conversion
### Aliases: as.data.frame.linkdat

### ** Examples


x = linkdat(toyped)
x

# Printing x as above is equivalent to:
as.data.frame(x, sep = '/', missing = '-', singleCol = TRUE)




