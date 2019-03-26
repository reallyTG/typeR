library(ggrasp)


### Name: ggrasp.write
### Title: ggrasp.write
### Aliases: ggrasp.write

### ** Examples

#Getting the ggrasp object
Enter.tree <- ggrasp.load(system.file("extdata", "Enter.kSNP.tree", package="ggrasp"), 
file.format = "tree", rank.file =system.file("extdata", "Enter.kSNP.ranks", package="ggrasp"));
## No test: 
Enter.tree.cluster <- ggrasp.cluster(Enter.tree)
## End(No test)

#Default examples: using the initizalized ggrasp object will 
#write the newick tree string to "tree.nwk"
ggrasp.write(Enter.tree, type="tree", file=file.path(tempdir(), "tree.nwk"));

# Using the clustered ggrasp object will write a text file with the clusters saved as an ITOL clade
# In conjecture with the phylogeny, this is readable by 
# ITOL web phylogeny visualizer (http://itol.embl.de/) 
## No test: 
ggrasp.write(Enter.tree.cluster, type="itol", file=file.path(tempdir(), "tree.itol.clade.txt"));
## End(No test)



