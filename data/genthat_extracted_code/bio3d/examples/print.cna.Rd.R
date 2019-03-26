library(bio3d)


### Name: print.cna
### Title: Summarize and Print Features of a cna Network Graph
### Aliases: print.cna summary.cna
### Keywords: utilities

### ** Examples


if (!requireNamespace("igraph", quietly = TRUE)) {
   message('Need igraph installed to run this example')
} else {

## Load the correlation network
attach(hivp)

## Read the starting PDB file to determine atom correspondence
pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
pdb <- read.pdb(pdbfile)

## Examine network composition
print(net)
x<- summary(net)
x$members[[2]]

detach(hivp)

}



