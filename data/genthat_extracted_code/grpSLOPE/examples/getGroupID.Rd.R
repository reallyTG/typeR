library(grpSLOPE)


### Name: getGroupID
### Title: Get a groupID object
### Aliases: getGroupID

### ** Examples

group  <- c("A", "A", 2, 9, "A", 9, 9, 2, "A")
group.id <- getGroupID(group)
group.id
# $A
# [1] 1 2 5 9
# 
# $`2`
# [1] 3 8
# 
# $`9`
# [1] 4 6 7
# 
# attr(,"class")
# [1] "groupID"




