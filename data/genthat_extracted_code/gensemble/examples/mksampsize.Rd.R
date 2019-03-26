library(gensemble)


### Name: mksampsize
### Title: Generate sample size information for use with 'gensemble'
### Aliases: mksampsize

### ** Examples



#regression
Y <- trees[,3]
#use roughly 80% for each training iteration
mksampsize(Y)
#the same thing using proportion
mksampsize(Y, 0.8, TRUE)

#classification
Y <- iris[,5]
#use rougly 80% of each class
mksampsize(Y)
#specifiy the size of each class in absolute terms
mksampsize(Y, list(setosa=20, versicolor=30, virginica=40))
#use about 70% of each class
mksampsize(Y, 0.7, proportion=TRUE)
#specifiy the proportion for each class
mksampsize(Y, c(0.5, 0.6, 0.7), proportion=TRUE)



