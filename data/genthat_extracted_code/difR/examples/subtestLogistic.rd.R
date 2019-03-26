library(difR)


### Name: subtestLogistic
### Title: Testing for DIF among subgroups with generalized logistic
###   regression
### Aliases: subtestLogistic print.subLogistic

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender (0 or 1) and trait anger score
##D  # ("Low" or "High")
##D  # Reference group: women with low trait anger score (<=20)
##D  group <- rep("WomanLow",nrow(verbal))
##D  group[Anger>20 & Gender==0] <- "WomanHigh"
##D  group[Anger<=20 & Gender==1] <- "ManLow"
##D  group[Anger>20 & Gender==1] <- "ManHigh"
##D 
##D  # New data set
##D  Verbal <- cbind(verbal[,1:24], group)
##D 
##D  # Reference group: "WomanLow"
##D  names <- c("WomanHigh", "ManLow", "ManHigh")
##D 
##D  # Testing all types of DIF with all items
##D  rDIF <- difGenLogistic(Verbal, group = 25, focal.names = names)
##D  rUDIF <- difGenLogistic(Verbal, group = 25, focal.names = names, type = "udif")
##D  rNUDIF <- difGenLogistic(Verbal, group = 25, focal.names = names, type = "nudif")
##D 
##D  # Subtests between the reference group and the first two focal groups
##D  # for item "S2WantShout" (item 6) and the three types of DIF
##D  subGroups <- c("WomanLow", "WomanHigh", "ManLow")
##D  subtestLogistic(rDIF, items = 6, groups = subGroups)
##D  subtestLogistic(rUDIF, items = 6, groups = subGroups)
##D  subtestLogistic(rNUDIF, items = 6, groups = subGroups) 
##D 
##D  # Subtests between the reference group and the first focal group
##D  # for items "S2WantShout" (item 6) and "S3WantCurse" (item 7)
##D  # (only both DIF effects)
##D  subGroups <- c("WomanLow", "WomanHigh")
##D  items1 <- c("S2WantShout", "S3WantCurse")
##D  items2 <- 6:7
##D  subtestLogistic(rDIF, items = items1, groups = subGroups)
##D  subtestLogistic(rDIF, items = items2, groups = subGroups)
##D  
## End(Not run)
 


