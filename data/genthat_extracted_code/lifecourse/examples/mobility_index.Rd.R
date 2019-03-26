library(lifecourse)


### Name: mobility_index
### Title: mobility index
### Aliases: mobility_index
### Keywords: mobility index

### ** Examples


#-----------------------------------------------------------------------
# Constructing 10000 sequences and calculating
#a test statistic (using the mobility index) from the resulting dataset.
#-----------------------------------------------------------------------

score = totalScore = 0
P = matrix("",nrow=10000,ncol=13)
myseq =  sample( LETTERS[c(1,4,5,7)], 13, prob=c(.25,.25,.25,.25), replace=TRUE )
# Each sequence contains four states.   
#Examples of states are distinct geographical locations or marital status categories.
for(i in 1:10000){
myseq1 =  sample( myseq )
P[i,1:13] = myseq1
score = (mobility_index(myseq1,LETTERS[c(1,4,5,7)],13))
totalScore = totalScore + score
}
dataset_one_score = totalScore/(10000*13)
# test statistic = 
#(sum of mobility index)/(total number of sequences * total number of years)
dataset_one_score




