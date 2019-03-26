library(cleanerR)


### Name: AutoComplete
### Title: 'AutoComplete' Asks for a dataframe, a vector of collumn indices
###   and the goal collumn and returns the data frame with the values
###   filled
### Aliases: AutoComplete

### ** Examples

#The Auto Complete Function shall do the following
#Take a dataframe and a goal collumn to predict
#Tests every combination of vectors limited by a parameter length
#Use the best set to predict with accuracy given by MeanAccuracy function
#Then to run some experiments first lets build a dataframe
e=sample(1:5,1e4,replace=TRUE)
e1=sample(1:5,1e4,replace=TRUE)
e2=sample(1:5,1e4,replace=TRUE)
e=data.frame(e,e1,e2,paste(LETTERS[e],LETTERS[e1]),paste(LETTERS[e],LETTERS[e1],LETTERS[e2])   )
#Now we got a dataframe lets create a copy of it
ce=e
ce[sample(1:nrow(e),0.3*nrow(e)),5]=NA
#So 30 percent of the data is now missing
#Lets try to recover it then with autocomplete
ce1=AutoComplete(df=ce,goal=5,maxi=3,repetitions=nrow(ce),trigger=1)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,5]!=e[,5]) )
# The process could be done for the 4 collum as well
ce=e
ce[sample(1:nrow(e),0.5*nrow(e)),4]=NA
#So 50 percent of the data is now missing
#Lets try to recover it then with autocomplete
ce1=AutoComplete(df=ce,goal=4,maxi=4,repetitions=nrow(ce),trigger=1)
#We can see how many values are still missing with NA_VALUES
print(NA_VALUES(ce1) )
#And check how many we got wrong by
print(sum(ce1[,4]!=e[,4]) )
#Here we can easily see e holds the original data
#ce1 is the recovered data



