library(rpsychi)


### Name: groupSummary
### Title: Compute summary statistics by group
### Aliases: groupSummary
### Keywords: univar

### ** Examples

data(infert)
infert$case <- factor(infert$case, labels=c("control", "case"))
infert$induced <- factor(infert$induced, labels=c("0","1","2 or more"))
infert$spontaneous <- factor(infert$spontaneous, labels=c("0","1","2 or more"))

#continuous and categorical variables
groupSummary(infert, group="case")

#continuous variables only
groupSummary(infert[, c(2,3,7,8, 5)], group="case")

#categorical variables only
groupSummary(infert[, c(1,4, 6, 5)],  group="case")    

#total sample
groupSummary(infert[, c(1,4, 6, 5)])




