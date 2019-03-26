library(IPCAPS)


### Name: export.groups
### Title: Export the IPCAPS result in to a text file
### Aliases: export.groups

### ** Examples


# Importantly, bed file, bim file, and fam file are required
# Use the example files embedded in the package

## No test: 
BED.file <- system.file("extdata","IPCAPS_example.bed",package="IPCAPS")
LABEL.file <- system.file("extdata","IPCAPS_example_individuals.txt",package="IPCAPS")

my.cluster <- ipcaps(bed=BED.file,label.file=LABEL.file,lab.col=2,out=tempdir())

#Here, to export the IPCAPS result to a text file
exported.data <- export.groups(my.cluster$output.dir)
print(dim(exported.data))
head(exported.data)
## End(No test)



