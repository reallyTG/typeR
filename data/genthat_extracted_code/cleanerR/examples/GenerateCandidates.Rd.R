library(cleanerR)


### Name: GenerateCandidates
### Title: 'GenerateCandidates' Asks for a dataframe and some parameters
###   and returns all possible combinations of collums for prediction that
###   satisfy a given error in input in a list the first element of the
###   list are the combinations while the second is its measure of error,to
###   get the best parameters call BestVector
### Aliases: GenerateCandidates

### ** Examples

#The GenerateCandidates function generates all sets of maximum length maxi.
#Maxi is a measure of error.
#This measure of error is related to the repetitions parameter.
#This parameter should range from 0 (rejects anything less to 100 percent accuracy)
#To number of rows of the dataframe to accept all.
#Lets generate a dataset
e=sample(1:5,1e4,replace=TRUE)
e1=sample(1:5,1e4,replace=TRUE)
e2=sample(1:5,1e4,replace=TRUE)
e=data.frame(e,e1,e2,paste(LETTERS[e],LETTERS[e1]),paste(LETTERS[e],LETTERS[e1],LETTERS[e2])   )
names(e)=c("random1","random2","random3","2randoms","3randoms")
#We can then generate all candidates to predict the 5 collumn
#We shall determine the reject part to 80 percent of the dataframe length
z=GenerateCandidates(df=e, goal=5, maxi=4, repetitions=0.8*nrow(e), trigger = 1)
#We can see z is a list
#z[[1]] is another list that contains all sets that satisfy our request
#z[[2]] is a measure of error, the smaller the more accurate
#Lets then order z[[1]] by z[[2]]
m=z[[1]][order(z[[2]])]
print(m)
#We can see then that m[[1]] holds the best set for prediction, while m[[length(m)]] the worst
#To prove it we can do the following
##cat("The best set to predict",names(e)[5],"is ",names(e)[m[[1]]],"\n"   )
##cat("Its expected accuracy is",MeanAccuracy(e,m[[1]],5),"\n"  )
##cat("The worst set to predict",names(e)[5],"is ",names(e)[m[[length(m)]]],"\n"   )
##cat("Its expected accuracy is",MeanAccuracy(e,m[[length(m)]],5),"\n"  )



