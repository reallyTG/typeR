library(labelrank)


### Name: nb_rank
### Title: Predicting label rankings based on the naive Bayes ranking model
### Aliases: nb_rank

### ** Examples

train.x <- lr.nom[1:16,]
test.x <- lr.nom[17,]
predrank <- nb_rank(train.x,y,test.x,n=1)



