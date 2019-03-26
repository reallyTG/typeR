library(psychometric)


### Name: discrim
### Title: Item Discrimination
### Aliases: discrim
### Keywords: models univar

### ** Examples

# see item.exam
# Scores on a test for 12 individuals
# 1 = correct
item1 <- c(1,1,1,0,1,1,1,1,1,1,0,1)
item2 <- c(1,0,1,1,1,1,1,1,1,1,1,0)
item3 <- c(1,1,1,1,1,1,1,1,1,1,1,1)
item4 <- c(0,1,0,1,0,1,0,1,1,1,1,1)
item5 <- c(0,0,0,0,1,0,0,1,1,1,1,1)
item6 <- c(0,0,0,0,0,0,1,0,0,1,1,1)
item7 <- c(0,0,0,0,0,0,0,0,1,0,0,0)
exam <- cbind(item1, item2, item3, item4, item5, item6, item7)
discrim(exam)


  


