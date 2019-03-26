library(stima)


### Name: stima.control
### Title: Control options for the stima function
### Aliases: stima.control
### Keywords: control-options

### ** Examples


##Adjust the stopping rule in a minimum of 5 observations in a terminal node
data(employee)
contr1<-stima.control(minbucket=5)


##Adjust the seed used to create an index vector for the 10fold cross-validation 
##With seed=3, the result equals the one reported in the online Appendix D of  
##the paper in the Journal of Computational and Graphical Statistics
##NB. To save time in the example, the splitting candidates of the regression  
##trunk(i.e., edu and jobtime) are selected with predtrunk=c(3,5),
##where 3 and 5 denote the column numbers in the dataset

contr2<-stima.control(sel="backward",seed=3,predtrunk=c(3,5))
emprt2<-stima(employee,2,first=3,control=contr2)
summary(emprt2)


##Apply a manual selection of predictors to be used in the pruned model
 
contr3<-stima.control(sel="manual",predsel=c(2,3,4,5,6,8))

 


