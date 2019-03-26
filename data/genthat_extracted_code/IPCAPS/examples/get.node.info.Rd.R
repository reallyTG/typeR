library(IPCAPS)


### Name: get.node.info
### Title: Get the information for specified node
### Aliases: get.node.info

### ** Examples


# Importantly, bed file, bim file, and fam file are required
# Use the example files embedded in the package

## No test: 
BED.file <- system.file("extdata","IPCAPS_example.bed",package="IPCAPS")
LABEL.file <- system.file("extdata","IPCAPS_example_individuals.txt",package="IPCAPS")

my.cluster <- ipcaps(bed=BED.file,label.file=LABEL.file,lab.col=2,out=tempdir())

#Here, to obtain the information of specified node, for example, node 3
node.info <- get.node.info(my.cluster,3)
ls(node.info)
## End(No test)



