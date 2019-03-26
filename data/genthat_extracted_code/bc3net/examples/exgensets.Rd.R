library(bc3net)


### Name: exgensets
### Title: Example gene sets defined from the CPDB database
### Aliases: exgensets
### Keywords: datasets

### ** Examples

  data(exgensets)

  # The gene set collection from CPDB can be formatted by:
  # "CPDB_pathways_genes.tab" is available in the download section in http://consensuspathdb.org/
  # cpdb = readLines("CPDB_pathways_genes.tab", warn = FALSE)
  # cpdb = lapply(cpdb, function(x) strsplit(x, "\t")[[1]])
  # names(cpdb) = sapply(cpdb, function(x) paste(x[3], x[2], x[1], sep=":") )       
  # cpdb = lapply(cpdb, function(x) x[-c(1:3)])
  # cpdb = cpdb[-length(cpdb)]
  # cpdb = lapply(cpdb, function(x) strsplit(x, ",")[[1]])



