library(PAFit)


### Name: graph_to_file
### Title: Write the graph in a PAFit_net object to file
### Aliases: graph_to_file

### ** Examples

library("PAFit")
# a network from Bianconi-Barabasi model
net        <- generate_BB(N = 50 , m = 10 , s = 10)
graph_to_file(net, file_name = "test.gml", format = "gml")



