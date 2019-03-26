library(KDViz)


### Name: ArticleSearch
### Title: Search articles from web
### Aliases: ArticleSearch
### Keywords: articles web scrapping

### ** Examples

myBibData <- ArticleSearch(c("knowledge domain visualization"),
  webSite = "ScienceDirect", maxSize = 7, saveCSV = FALSE)

head(myBibData, 3)



