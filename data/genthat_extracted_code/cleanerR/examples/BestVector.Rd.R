library(cleanerR)


### Name: BestVector
### Title: 'BestVector' Asks for a dataframe and some parameters and
###   returns the best combination of collums to predict the missing value
### Aliases: BestVector

### ** Examples

#The Best Vector Function shall do the following
#Take a dataframe and a goal collumn to predict
#Tests every combination of vectors limited by a parameter length
#Returns the best set to predict the goal
#Then to run some experiments first lets build a dataframe
e=sample(1:2,1e2,replace=TRUE)
e1=sample(1:2,1e2,replace=TRUE)
e2=sample(1:2,1e2,replace=TRUE)
e=data.frame(e,e1,e2,paste(LETTERS[e],LETTERS[e1]),paste(LETTERS[e],LETTERS[e1],LETTERS[e2])   )
#We can easily see that to predict the last collumn you need the first three.
#Lets Check what the function will find
z=BestVector(e,5,3,nrow(e),1)
print(z)
#Lets now check what is the best set if we use only 2 collumns maximum
z1=BestVector(e,5,2,nrow(e),1)
print(z1)
#We could also predict which collumn is best to predict the fourth one
z2=BestVector(e,4,2,nrow(e),1)
print(z2)
#We could also take a look at the dataset iris.
#Since this dataset does not repeat lines we must use trigger=0
#To predict Species
z3=BestVector(iris,5,2,nrow(iris),0)
print(names(iris))[z3]
#We can check the accuracy of these predictions with the accuracy functions
print(MeanAccuracy(iris,z3,5))
print(MeanAccuracy(e,z2,4))
print(MeanAccuracy(e,z1,5))
print(MeanAccuracy(iris,z,5))



