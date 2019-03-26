library(TiddlyWikiR)


### Name: twList-class
### Title: A class to handle TiddlyWiki lists.
### Aliases: elements elements<- initialize,twList-method level level<-
###   twList twList-class type type<-
### Keywords: list wiki

### ** Examples

list1 <- new ("twList", elements = c("line one", "line two", "line three"),
              level = c(1,2,2), type = c("u", "o", "o"))
list2 <- twList (LETTERS[1:5])

wikify (list1)
wikify (list2)



