library(TiddlyWikiR)


### Name: twTable-class
### Title: A class to handle TiddlyWiki tables.
### Aliases: [,twTable-method align,twTable-method align<-,twTable-method
###   bgcolor bgcolor<- color color<- colref colref<- dat dat<- digits
###   digits<- dim,twTable-method footer footer<- includeColNames
###   includeColNames<- includeRowNames includeRowNames<-
###   initialize,twTable-method ref,twTable-method ref<-,twTable-method
###   rowref rowref<- sortable sortable<- title,twTable-method title<-
###   twTable twTable-class
### Keywords: table wiki

### ** Examples

myData <- as.data.frame (matrix (rnorm (12), ncol = 4))
myTable <- new ("twTable", dat = myData)
wikify (myTable)



