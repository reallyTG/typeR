library(RNewsflow)


### Name: document.network
### Title: Create a document similarity network
### Aliases: document.network

### ** Examples

d = data.frame(x = c(1,1,1,2,2,3),
               y = c(2,3,5,4,5,6),
               v = c(0.3,0.4,0.7,0.5,0.2,0.9))

meta = data.frame(document_id = 1:8,
                  date = seq.POSIXt(from = as.POSIXct('2010-01-01 12:00:00'), 
                         by='hour', length.out = 8),
                  medium = c(rep('Newspapers', 4), rep('Blog', 4)))

g = document.network(d, meta)

igraph::get.data.frame(g, 'both')
igraph::plot.igraph(g)



