library(BioGeoBEARS)


### Name: get_lagrange_nodenums
### Title: Get internal node numbers in LAGRANGE's downpass order
### Aliases: get_lagrange_nodenums

### ** Examples

extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
tmppath = paste(extdata_dir,
"/examples/Psychotria_M0/LGcpp/Psychotria_5.2.newick", sep="")
trfn = np(slashslash(tmppath))
tr = read.tree(trfn)
downpass_node_matrix = get_lagrange_nodenums(tr)
downpass_node_matrix


downpass_node_matrix = get_lagrange_nodenums(tr)
downpass_node_matrix = downpass_node_matrix[order(downpass_node_matrix[,2]), ]
plot(tr)
nodelabels(node=20:37, downpass_node_matrix[,1])
tiplabels(1:19)

plot(tr)
nodelabels(node=20:37, downpass_node_matrix[,2])
tiplabels(1:19)

downpass_node_matrix = get_lagrange_nodenums(tr)
downpass_node_matrix = downpass_node_matrix[order(downpass_node_matrix[,1]), ]
plot(tr)
nodelabels(node=20:37, downpass_node_matrix[,1])
tiplabels(1:19)

# THIS WORKS
plot(tr)
nodelabels(node=20:37, downpass_node_matrix[,2])
tiplabels(1:19)



