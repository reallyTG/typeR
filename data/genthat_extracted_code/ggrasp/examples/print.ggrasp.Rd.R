library(ggrasp)


### Name: print.ggrasp
### Title: print.ggrasp
### Aliases: print.ggrasp

### ** Examples

#Getting the ggrasp object
Enter.tree <- ggrasp.load(system.file("extdata", "Enter.kSNP.tree", package="ggrasp"), 
file.format = "tree", rank.file =system.file("extdata", "Enter.kSNP.ranks", package="ggrasp"));
## No test: 
Enter.tree.cluster <- ggrasp.cluster(Enter.tree)
## End(No test)

#Default examples: using the initizalized ggrasp object will print the newick tree string 
print(Enter.tree);

# Using the clustered ggrasp object will print the medoids and their respective clusters
## No test: 
print(Enter.tree.cluster)
## End(No test)
#Below are examples of using different output formats and rank levels
## No test: 
print(Enter.tree.cluster, "tree")
## End(No test)
## No test: 
print(Enter.tree.cluster, "table", 1)
## End(No test)
## No test: 
print(Enter.tree.cluster, "table", 0)
## End(No test)



