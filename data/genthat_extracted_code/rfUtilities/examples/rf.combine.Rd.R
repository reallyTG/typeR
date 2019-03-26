library(rfUtilities)


### Name: rf.combine
### Title: Combine Random Forests Ensembles
### Aliases: rf.combine

### ** Examples

library(randomForest)
data(iris)

c1 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)
c2 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)
c3 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)

( class.combine <- rf.combine(c1,c2,c3) )

data(airquality)
set.seed(131)
r1 <- randomForest(Ozone ~ ., data=airquality, mtry=3,
                   importance=TRUE, na.action=na.omit)
r2 <- randomForest(Ozone ~ ., data=airquality, mtry=3,
                   importance=TRUE, na.action=na.omit)
r3 <- randomForest(Ozone ~ ., data=airquality, mtry=3,
                   importance=TRUE, na.action=na.omit)

( regress.combine <- rf.combine(r1,r2,r3) )				   




