library(crank)


### Name: listCrawler
### Title: Descend a list, applying a function to each element.
### Aliases: listCrawler
### Keywords: misc

### ** Examples

 # a simple example using the square root function
 testlist<-list(list(9,16),list(25,list(36,49)))
 # first get the default maximum
 listCrawler(testlist,sqrt)
 # then the minimum
 listCrawler(testlist,sqrt,maxval=FALSE)



