library(crunch)


### Name: Categories-class
### Title: Categories in CategoricalVariables
### Aliases: Categories-class Categories ids ids<- values values<-
###   id.AbstractCategory ids.AbstractCategories Category-class Category
###   [,AbstractCategories,ANY,ANY-method
###   [,AbstractCategories,character,ANY-method
###   [,AbstractCategories,numeric,ANY-method
###   [<-,AbstractCategories,character,ANY,ANY-method
###   [[,AbstractCategories,character-method
###   [[<-,AbstractCategories,character,ANY,ANY-method
###   names,AbstractCategories-method names<-,AbstractCategories-method
###   ids,AbstractCategories-method [<-,Categories,ANY,ANY,ANY-method
###   ids<-,Categories-method values,Categories-method
###   values<-,Categories-method

### ** Examples

cat.a <- Category(name="First", id=1, numeric_value=1, missing=FALSE)
cat.b <- Category(data=list(name="First", id=1, numeric_value=1, missing=FALSE))
identical(cat.a, cat.b)
cat.c <- Category(name="Second", id=2)
cats.1 <- Categories(cat.a, cat.c)
cats.2 <- Categories(data=list(cat.a, cat.c))
identical(cats.1, cats.2)



