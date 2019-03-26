library(likert)


### Name: likert
### Title: Analyze Likert type items.
### Aliases: likert

### ** Examples

data(pisaitems)
items29 <- pisaitems[,substr(names(pisaitems), 1,5) == 'ST25Q']
names(items29) <- c("Magazines", "Comic books", "Fiction", 
                   "Non-fiction books", "Newspapers")
l29 <- likert(items29)
summary(l29)
plot(l29)



