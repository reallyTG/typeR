library(iDOS)


### Name: load.datasets
### Title: load.datasets
### Aliases: load.datasets
### Keywords: datasets

### ** Examples


# locate test data directory which comes with the package
data.dir <- paste(system.file("programdata/testdata/", package = "iDOS"), "/", sep = "");

# read meta data file
metadata <- read.table(
  file = paste(data.dir, "metadata.txt", sep = ""), 
  row.names = 1, 
  header = TRUE, 
  sep = "\t",
  stringsAsFactors = FALSE
  );

x <- load.datasets(
  data.dir = data.dir,
  metadata = metadata,
  data.types = c("mRNA.T", "mRNA.N", "ann")
  );




