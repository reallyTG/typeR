library(stm)


### Name: findThoughts
### Title: Find Thoughts
### Aliases: findThoughts print.findThoughts plot.findThoughts

### ** Examples

findThoughts(gadarianFit, texts=gadarian$open.ended.response, topics=c(1,2), n=3)

#We can plot findThoughts objects using plot() or plotQuote
thought <- findThoughts(gadarianFit, texts=gadarian$open.ended.response, topics=1, n=3)

#plotQuote takes a set of sentences
plotQuote(thought$docs[[1]])

#we can use the generic plot as a shorthand which will make one plot per topic
plot(thought)

#we can select a subset of examples as well using either approach
plot(thought,2:3)
plotQuote(thought$docs[[1]][2:3])


#gather thoughts for only treated documents
thought <- findThoughts(gadarianFit, texts=gadarian$open.ended.response, topics=c(1,2), n=3, 
                       where = treatment==1, meta=gadarian)
plot(thought)
#you can also query in terms of other topics
thought <- findThoughts(gadarianFit, texts=gadarian$open.ended.response, topics=c(1), n=3, 
                        where = treatment==1 & Topic2>.2, meta=gadarian)
plot(thought)         
#these queries can be really complex if you like
thought <- findThoughts(gadarianFit, texts=gadarian$open.ended.response, topics=c(1), n=3, 
                       where = (treatment==1 | pid_rep > .5) & Topic3>.2, meta=gadarian)
plot(thought)         



