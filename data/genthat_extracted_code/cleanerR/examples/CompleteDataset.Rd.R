library(cleanerR)


### Name: CompleteDataset
### Title: 'CompleteDataset' Asks for a dataframe, a vector of collumn
###   indices and the goal collumn and returns the data frame with the
###   values filled
### Aliases: CompleteDataset

### ** Examples

#The CompleteDataset Function shall do the following
#Take a dataframe and a goal collumn to predict
#Takes a set of vectors to use for prediction
#Use this set to predict with accuracy given by MeanAccuracy function
#Then to run some experiments first lets build a dataframe
e=sample(1:5,1e4,replace=TRUE)
e1=sample(1:5,1e4,replace=TRUE)
e2=sample(1:5,1e4,replace=TRUE)
e=data.frame(e,e1,e2,paste(LETTERS[e],LETTERS[e1]),paste(LETTERS[e],LETTERS[e1],LETTERS[e2])   )
#Now we got a dataframe lets create a copy of it
ce=e
ce[sample(1:nrow(e),0.3*nrow(e)),5]=NA
#So 30 percent of the data is now missing
#Lets try to recover it then with CompleteDataset
#First we must choose a set of vectors to use
#Lets first try with BestVector
vector_c=BestVector(ce,5,4,nrow(ce),1)
ce1=CompleteDataset(ce,rows=vector_c,goal=5)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,5]!=e[,5]) )
#If the user wanted he of course could choose a set of his own, for example
user_set=c(1,3)
ce1=CompleteDataset(ce,rows=user_set,goal=5)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,5]!=e[,5]) )
#But we can see that is not the best solution
#To see how to check the best sets take a look at generate_candidates
# The process could be done for the 4 collum as well
ce=e
ce[sample(1:nrow(e),0.5*nrow(e)),4]=NA
#So 50 percent of the data is now missing
#Lets try to recover it then with CompleteDataset
vector_c=BestVector(ce,4,4,nrow(ce),1)
ce1=CompleteDataset(ce,rows=vector_c,goal=4)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,4]!=e[,4]) )
#Here we can easily see e holds the original data
#ce1 is the recovered data



