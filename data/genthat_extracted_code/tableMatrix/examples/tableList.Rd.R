library(tableMatrix)


### Name: tableList
### Title: tableList constructor
### Aliases: tableList

### ** Examples


data(chickwts)

# Bundle chickwts data.frame together with a linear model
TL <- tableList(chickwts, lm(weight~feed, chickwts))

# tableList behaves like a data.table  
mean(TL[feed=="casein", weight])

# Aid part of the tableList object carries the linear model
aid(TL)

# dataType support
TL <- tableList(chickwts, lm(weight~feed, chickwts), dataType=list(group1="weight", group2="feed"))




