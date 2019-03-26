library(RDIDQ)


### Name: sumry_categorical
### Title: Summary of categorical variable
### Aliases: sumry_categorical

### ** Examples

library(descr)
data(iris)
#first identify categorical variable from the dataset using following function
iris[,5]=as.character(iris[,5])
iris[,4]=as.character(iris[,4])
cat_data=ident_cat(iris)
summry_cat=sumry_categorical(cat_data)



