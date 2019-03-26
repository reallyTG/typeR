library(Robocoap)


### Name: novel.coap
### Title: novel.coap
### Aliases: novel.coap
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Co-apperance vs Interaction Plots
## Co-apperance can be automatized, detect interactions is however a hard AI problem
## than can be approximated by the co-apperances when the story is long enough.

txt <- paste("A woman gets on a bus with her baby. The bus driver says:", "'Ugh,
that's the ugliest baby I've ever seen!' The woman walks", "to the rear of the
bus and sits down, fuming. She says to a man", "next to her: 'The driver just
insulted me!\n\nPun\n' The man says:", "'What? you just go back there and tell him
off. Go on, I'll hold", "your monkey for you.'")

res <- Robocoap::novel.coap(novel = txt, characters = c('woman','driver','baby|monkey','man'),
                 split = 'Pun', language = 'english', plot = FALSE)
res$coapmat
layout(matrix(c(1,2), ncol=2))
par(ask=FALSE)
plot(igraph::graph.adjacency(res$coapmat), main = 'Coapperances')

# Manually creating a matrix of interactions (A action on B)
inter <- res$coapmat
inter[] <- 0
# A woman gets on a bus with her baby ...
inter[4,1] <- 1
# The bus driver says ...
inter[2,4] <- 1
# She says to a man next to her: ...
inter[4,3] <- 1
# The man says: ...
inter[3,4] <- 1

plot(igraph::graph.adjacency(inter), main = 'Interactions')
layout(1)

## TODO Write instructions to load files into Gephi when gephi = TRUE
## To import the results into gephi set the gephi parameter to TRUE





