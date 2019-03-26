library(qdap)


### Name: word_length
### Title: Count of Word Lengths Type
### Aliases: word_length
### Keywords: letters

### ** Examples

## Not run: 
##D (x <- with(DATA, word_length(state, person)))
##D plot(x)
##D scores(x)
##D proportions(x)
##D counts(x)
##D plot(scores(x))
##D plot(proportions(x))
##D plot(counts(x))
##D 
##D (x2 <- word_length(DATA[["state"]]))
##D (x2 <- word_length(DATA[["state"]], apostrophe.remove=TRUE))
##D 
##D ## Example Visualizations with Presidential Debate Data
##D library(tidyr)
##D (x_long <- proportions(x) %>% 
##D     gather("Letter_Length", "Proportion", -c(1:2)))
##D ggplot(x_long, aes(x = Letter_Length, y = Proportion, color=person, group=person)) +
##D     geom_line(size=.8)
##D 
##D 
##D (x3 <- with(pres_debates2012, word_length(dialogue, person)))
##D (x_long2 <- proportions(x3) %>% 
##D     gather("Letter_Length", "Proportion", -c(1:2)))
##D ggplot(x_long, aes(x = Letter_Length, weight = Proportion, fill=person, group=person)) +
##D     geom_bar()
##D 
##D ggplot(x_long, aes(x = Letter_Length, weight = Proportion, fill=person)) +
##D     geom_bar() + 
##D     facet_wrap(~person, ncol=1)
##D         
##D ggplot(x_long, aes(x = Letter_Length, weight = Proportion, fill=person)) +
##D     geom_bar() + 
##D     coord_flip() + 
##D     facet_wrap(~person, ncol=1)
##D 
##D ggplot(x_long, aes(x = person, weight = Proportion)) +
##D     geom_bar(fill="grey40") + 
##D     coord_flip() + 
##D     facet_grid(Letter_Length~.)
## End(Not run)



