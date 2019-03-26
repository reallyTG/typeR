library(multinet)


### Name: Getting networks: IO
### Title: Reading and writing multilayer networks from/to file
### Aliases: 'Getting networks: IO' read.ml write.ml

### ** Examples

# writing a network to file...
file <- tempfile("aucs.mpx")
net <- ml.aucs()
write.ml(net,file)
# ...and reading it back into a variable
net <- read.ml(file,"AUCS")
net
# the following network has more nodes, because all
# actors are replicated to all graphs
net.aligned <- read.ml(file,"AUCS",aligned=TRUE)
net.aligned



