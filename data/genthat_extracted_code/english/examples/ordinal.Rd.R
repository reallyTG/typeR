library(english)


### Name: ordinal
### Title: Generic functions and methods generating english versions of
###   ordinal whole numbers as character strings
### Aliases: ordinal ordinal.numeric ordinal.character ordinal.english
### Keywords: arith

### ** Examples

## for UK style English:
ordinal(c(1, 9, 10, 11, 12, 19, 20, 21, 99, 100, 101, 109, 111,
          119, 1000, 1100, 1199, 9999, 10000, 10001), UK = TRUE)
## for USA style English:
ordinal(c(1, 9, 10, 11, 12, 19, 20, 21, 99, 100, 101, 109, 111,
          119, 1000, 1100, 1199, 9999, 10000, 10001), UK = FALSE)
## For mothers of small children:
cat(paste("This is the", ordinal(1:5), "time I've told you!"), sep = "\n")



