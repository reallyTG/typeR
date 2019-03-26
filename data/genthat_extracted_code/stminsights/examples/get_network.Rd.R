library(stminsights)


### Name: get_network
### Title: extract topic correlation network
### Aliases: get_network

### ** Examples


library(stm)
library(ggraph)
library(quanteda)

# prepare data
data <- corpus(gadarian, text_field = 'open.ended.response')
docvars(data)$text <- texts(data)
data <- dfm(data, stem = TRUE, remove = stopwords('english'),
            remove_punct = TRUE)
out <- convert(data, to = 'stm')

# fit model
gadarian_10 <- stm(documents = out$documents,
                   vocab = out$vocab,
                   data = out$meta,
                   prevalence = ~ treatment + s(pid_rep),
                   K = 10,
                   max.em.its = 1, # reduce computation time for example
                   verbose = FALSE)

# extract network
stm_corrs <- get_network(model = gadarian_10,
                         method = 'simple',
                         labels = paste('Topic', 1:10),
                         cutoff = 0.001,
                         cutiso = TRUE)

## Not run: 
##D # plot network
##D ggraph(stm_corrs, layout = 'fr') +
##D   geom_edge_link(
##D     aes(edge_width = weight),
##D     label_colour = '#fc8d62',
##D     edge_colour = '#377eb8') +
##D   geom_node_point(size = 4, colour = 'black')  +
##D   geom_node_label(
##D     aes(label = name, size = props),
##D     colour = 'black',  repel = TRUE, alpha = 0.85) +
##D   scale_size(range = c(2, 10), labels = scales::percent) +
##D   labs(size = 'Topic Proportion',  edge_width = 'Topic Correlation') +
##D   scale_edge_width(range = c(1, 3)) +
##D   theme_graph()
## End(Not run)




