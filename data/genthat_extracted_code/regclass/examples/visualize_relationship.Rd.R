library(regclass)


### Name: visualize_relationship
### Title: Visualizing the relationship between y and x in a partition
###   model
### Aliases: visualize.relationship visualize_relationship

### ** Examples

  data(SALARY)
  FOREST <- randomForest(Salary~.,data=SALARY)
  visualize_relationship(FOREST,interest="Experience",on=SALARY)
  visualize_relationship(FOREST,interest="Months",on=SALARY,xlim=c(1,15),ylim=c(2500,4500))

  data(WINE)
  TREE <- rpart(Quality~.,data=WINE)
  visualize_relationship(TREE,interest="alcohol",on=WINE,smooth=FALSE)
  visualize_relationship(TREE,interest="alcohol",on=WINE,marginal=FALSE,nplots=7,smooth=FALSE)



