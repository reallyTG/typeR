library(cleanerR)


### Name: BestAccuracy
### Title: 'BestAccuracy' Asks for a dataframe, a vector of collumn indices
###   and the goal collumn and returns the maximum possible value of
###   accuracy of filling missing values
### Aliases: BestAccuracy

### ** Examples

#The Best accuracy function tells its user the best accuracy possible.
#Code with two ## is working code but takes longer than 5 seconds
#Given a set and a goal to predict it supposes the following.
#All missing values are contained in the possible values with lowest uncertainty.
#Lets first Consider the iris dataset
#It has the following parameters
print(names(iris))
#As we can see the 5 collumn is species
#Lets use Sepal.Length to predict Species and see Best accuracy
print(BestAccuracy(iris,1,5))
#Now lets use both sepal parameters
print(BestAccuracy(iris,1:2,5))
#And when using a Petal parameter as well
##print(BestAccuracy(iris,1:3,5))
#We can see that iris even in the best case scenario species can be defined by these 3
#Now lets take a look at the mtcars dataset
##print(names(mtcars))
#Predicting gear using mpg
##print(BestAccuracy(mtcars,1,10))
#But if we try to predict mpg using gear
##print(BestAccuracy(mtcars,10,1))
#So using the best accuracy function we can know whats the best case accuracy
#If the user requires he can also predict more than 1 goal for example
##print(BestAccuracy(mtcars,c(1,3,5),c(10,11)))
#In this case we want to use mpg,disp,drat to predict a pair gear,carb
#To check the confidence of predicted values the user should use all three accuracy functions



