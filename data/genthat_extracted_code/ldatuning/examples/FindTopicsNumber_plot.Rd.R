library(ldatuning)


### Name: FindTopicsNumber_plot
### Title: FindTopicsNumber_plot
### Aliases: FindTopicsNumber_plot

### ** Examples

## Not run: 
##D 
##D library(topicmodels)
##D data("AssociatedPress", package="topicmodels")
##D dtm <- AssociatedPress[1:10, ]
##D optimal.topics <- FindTopicsNumber(dtm, topics = 2:10,
##D   metrics = c("Arun2010", "CaoJuan2009", "Griffiths2004")
##D )
##D FindTopicsNumber_plot(optimal.topics)
## End(Not run)




