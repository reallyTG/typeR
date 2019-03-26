library(IPCAPS)


### Name: save.plots
### Title: Workflow to generate HTML files for all kinds of plots
### Aliases: save.plots

### ** Examples


# Importantly, bed file, bim file, and fam file are required
# Use the example files embedded in the package

## No test: 
BED.file <- system.file("extdata","IPCAPS_example.bed",package="IPCAPS")
LABEL.file <- system.file("extdata","IPCAPS_example_individuals.txt",package="IPCAPS")

my.cluster <- ipcaps(bed=BED.file,label.file=LABEL.file,lab.col=2,out=tempdir())

#Here, to generate all plots and HTML files
save.plots.label.html(my.cluster$output.dir)
## End(No test)



