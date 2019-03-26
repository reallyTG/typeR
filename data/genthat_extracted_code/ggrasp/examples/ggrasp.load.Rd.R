library(ggrasp)


### Name: ggrasp.load
### Title: ggrasp.load
### Aliases: ggrasp.load

### ** Examples

#The following data is from Chavda et al 2016 which phylotyped Enterobacter genomes
# Our example uses the data underpinning the tree shown in Figure 2
# Also included is a ranking file to prioritize closed Enterobactor genomes

library(ggrasp);
tree.file <- system.file("extdata", "Enter.kSNP.tree", package="ggrasp")
rank.file.in <- system.file("extdata", "Enter.kSNP.ranks", package="ggrasp")
Enter.tree <- ggrasp.load(tree.file, file.format = "tree", rank.file = rank.file.in);

# Other options include loading by fasta file:
fasta.file <- system.file("extdata", "Enter.kSNP2.fasta", package="ggrasp")
rank.file.in <- system.file("extdata", "Enter.kSNP.ranks", package="ggrasp")
Enter.tree <- ggrasp.load(fasta.file, file.format = "fasta", rank.file =rank.file.in)

# and by distance matrix. Since this distance matrix is actually percent identity,
# we will us an offset of 100
mat.file <- system.file("extdata", "Enter.ANI.mat", package="ggrasp")
rank.file.in <- system.file("extdata", "Enter.kSNP.ranks", package="ggrasp")
Enter.in <- ggrasp.load(mat.file, file.format = "matrix", rank.file =rank.file.in, offset = 100)

# Use summary() to examine the data loaded
summary(Enter.in)

#Use plot() to see the tree
## No test: 
plot(Enter.in)
## End(No test)



