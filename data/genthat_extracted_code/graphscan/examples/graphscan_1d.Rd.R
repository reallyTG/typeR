library(graphscan)


### Name: graphscan_1d
### Title: Creates objects of class 'graphscan' using 1D data.
### Aliases: graphscan_1d graphscan_1d,character-method
###   graphscan_1d,DNAbin-method graphscan_1d,list-method
### Keywords: cluster DNA mutation

### ** Examples

# example with 2 fasta format files containing each 
# 2 DNA aligned sequences.
# the output object contain 6 events series.
dna_file<-list.files(path=system.file("extdata",package="graphscan"),
 pattern="fna",full.names=TRUE)
g1<-graphscan_1d(data=dna_file)

# to perform only 4 comparisons between DNA sequences 
# 1 vs 3, 1 vs 4, 2 vs 3 and 2 vs 4.
g2<-graphscan_1d(data=dna_file,events_series=list(1:2,3:4))

# example with 'DNABin' class object :
require(ape)
data(woodmouse)
g3<-graphscan_1d(data=woodmouse)

# example with a list of 9 events series 
data(events_series)
g4<-graphscan_1d(events_series,normalisation_factor=normalisation_factor)



