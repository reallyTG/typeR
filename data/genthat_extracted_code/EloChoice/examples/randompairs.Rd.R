library(EloChoice)


### Name: randompairs
### Title: generate random data of pairwise preference ratings
### Aliases: randompairs

### ** Examples

# a relatively balanced data set
xdata <- randompairs(20, 500, skew=FALSE)
table(c(as.character(xdata$winner), as.character(xdata$loser)))
range(table(c(as.character(xdata$winner), as.character(xdata$loser))))
# and a less balanced data set
xdata <- randompairs(20, 500, skew=TRUE)
table(c(as.character(xdata$winner), as.character(xdata$loser)))
range(table(c(as.character(xdata$winner), as.character(xdata$loser))))



