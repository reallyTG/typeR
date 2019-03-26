library(qdap)


### Name: word_network_plot
### Title: Word Network Plot
### Aliases: word_network_plot
### Keywords: network

### ** Examples

## Not run: 
##D word_network_plot(text.var=DATA$state)
##D word_network_plot(text.var=DATA$state, stopwords=NULL)
##D word_network_plot(text.var=DATA$state, DATA$person)
##D word_network_plot(text.var=DATA$state, DATA$person, stopwords=NULL)
##D word_network_plot(text.var=DATA$state, grouping.var=list(DATA$sex,
##D     DATA$adult))
##D word_network_plot(text.var=DATA$state, grouping.var=DATA$person,
##D     title.name = "TITLE", log.labels=TRUE)
##D word_network_plot(text.var=raj.act.1$dialogue, grouping.var=raj.act.1$person,
##D   stopwords = Top200Words)
##D 
##D #insert double tilde ("~~") to keep dual words (e.g., first last name)
##D alts <- c(" fun", "I ")
##D state2 <- mgsub(alts, gsub("\\s", "~~", alts), DATA$state)
##D word_network_plot(text.var=state2, grouping.var=DATA$person)
##D 
##D ## Invisibly returns the igraph model
##D x <- word_network_plot(text.var=DATA$state, DATA$person)
##D str(x)
##D library(igraph)
##D plot(x, vertex.size=0, vertex.color="white", edge.curved = TRUE)
##D 
##D x2 <- word_network_plot(text.var=DATA$state, grouping.var=DATA$person,
##D     title.name = "TITLE", log.labels = TRUE, label.size = 1.2)
##D l <- layout.drl(x2, options=list(simmer.attraction=0))
##D plot(x2, vertex.size=0, layout = l)
## End(Not run)



