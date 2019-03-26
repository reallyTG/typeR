library(BioGeoBEARS)


### Name: get_pruningwise_nodenums
### Title: Get internal node numbers in pruningwise order
### Aliases: get_pruningwise_nodenums

### ** Examples

extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
tmpdir = paste(extdata_dir,
"/examples/Psychotria_M0/LGcpp/Psychotria_5.2.newick", sep="")
trfn = np(slashslash(tmpdir))
tr = read.tree(trfn)
node_numbers_matrix = get_pruningwise_nodenums(tr)
node_numbers_matrix



