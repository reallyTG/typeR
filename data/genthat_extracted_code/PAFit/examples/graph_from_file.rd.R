library(PAFit)


### Name: graph_from_file
### Title: Read file to a PAFit_net object
### Aliases: graph_from_file

### ** Examples

  library("PAFit")
  # a network from Bianconi-Barabasi model
  net        <- generate_BB(N = 50 , m = 10 , s = 10)
  graph_to_file(net, file_name = "test.gml", format = "gml")
  reread    <- graph_from_file(file_name = "test.gml", format = "gml")



