library(SDDE)


### Name: complete_trace
### Title: return properties of a single path in two given networks
###   (original and augmented, presented as undirected graphs) using a path
###   analysis
### Aliases: complete_trace

### ** Examples

## Searching the sample data for the path type between node x1 and x5
data(Sample_1)
##
## Not run: complete_trace(g1,g2,node1="x1", node2="x5")
## Expected results:
## $from
## [1] "x1"
## $to
## [1] "x5"
## $path_type
## [1] "Detour"
## $original_path_length
## [1] 2
## $augmented_path_length
## [1] 3
## $path
## [1] "x1" "x14" "x6" "x5" 
## $path_visited_taxa
## [1] 1 2 1 1



