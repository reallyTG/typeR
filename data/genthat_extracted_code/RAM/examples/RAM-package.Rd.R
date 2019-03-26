library(RAM)


### Name: RAM-package
### Title: Analysis of Amplicon-Based Metagenomic Data
### Aliases: RAM-package RAM
### Keywords: package

### ** Examples

## Not run: 
##D # load data from your own files...
##D otu1 <- fread.OTU("path/to/OTU/table")
##D otu2 <- read.OTU("path/to/OTU/table")
##D meta1 <- fread.meta("path/to/meta/table")
##D meta2 <- read.meta("path/to/meta/table")
##D # ...or use the included sample data
##D data(ITS1, ITS2, meta)
##D data <- list(ITS1=ITS1, ITS2=ITS2)
##D dissim.heatmap(ITS1, meta, row.factor=c(City="City"))
##D dissim.alleig.plot(data)
##D data(alignment)
##D # type library(help = RAM) to get a full listing of help 
##D documents
## End(Not run)



