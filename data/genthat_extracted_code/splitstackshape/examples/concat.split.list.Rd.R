library(splitstackshape)


### Name: concat.split.list
### Title: Split Concatenated Cells into a List Format
### Aliases: concat.split.list cSplit_l

### ** Examples


temp <- head(concat.test)
str(cSplit_l(temp, "Likes"))
cSplit_l(temp, 4, ";")

## The old function name still works
str(concat.split.list(temp, "Likes"))
concat.split.list(temp, 4, ";")
concat.split.list(temp, 4, ";", drop = TRUE)




