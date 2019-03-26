library(IPCAPS)


### Name: ipcaps
### Title: Perform unsupervised clustering to capture population structure
###   based on iterative pruning
### Aliases: ipcaps

### ** Examples


#Use the BED format as input
#Importantly, bed file, bim file, and fam file are required
#Use the example files embedded in the package

## No test: 
BED.file <- system.file("extdata", "IPCAPS_example.bed", package = "IPCAPS")
LABEL.file <- system.file("extdata", "IPCAPS_example_individuals.txt",
                          package = "IPCAPS")
my.cluster1 <- ipcaps(bed = BED.file, label.file = LABEL.file, lab.col = 2,
out = tempdir())

table(my.cluster1$cluster$label, my.cluster1$cluster$group)

# Use a text file as input
# Use the example files embedded in the package

text.file <- system.file("extdata", "IPCAPS_example_rowVar_colInd.txt",
                         package="IPCAPS")
LABEL.file <- system.file("extdata", "IPCAPS_example_individuals.txt",
                          package="IPCAPS")

my.cluster2 <- ipcaps(files = c(text.file), label.file = LABEL.file, lab.col = 2,
                      out=tempdir())
table(my.cluster2$cluster$label, my.cluster2$cluster$group)

# Use an R Data file as input
# Use the example file embedded in the package

rdata.file <- system.file("extdata", "IPCAPS_example.RData", package = "IPCAPS")

my.cluster3 <- ipcaps(rdata = rdata.file, out = tempdir())
table(my.cluster3$cluster$label, my.cluster3$cluster$group)
## End(No test)




