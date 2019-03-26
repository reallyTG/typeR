library(splitstackshape)


### Name: concat.split.expanded
### Title: Split Concatenated Values into their Corresponding Column
###   Position
### Aliases: concat.split.expanded cSplit_e

### ** Examples


temp <- head(concat.test)
cSplit_e(temp, "Likes")
cSplit_e(temp, 4, ";", fill = 0)
 
## The old function name still works
concat.split.expanded(temp, "Likes")
concat.split.expanded(temp, 4, ";", fill = 0)
concat.split.expanded(temp, 4, ";", mode = "value", drop = TRUE)
concat.split.expanded(temp, "Siblings", type = "character", drop = TRUE)




