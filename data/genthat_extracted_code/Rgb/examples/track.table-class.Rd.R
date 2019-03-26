library(Rgb)


### Name: track.table-class
### Title: Class '"track.table"'
### Aliases: track.table-class
### Keywords: classes

### ** Examples

  # Exemplar data : subset of human genes
  data(hsFeatures)
  
  # Construction
  trackTable <- track.table(
    hsGenes,
    .name = "NCBI Genes",
    .organism = "Homo sapiens",
    .assembly = "GRCh37"
  )
  
  # Slicing
  print(trackTable$slice(chrom="1", as.integer(15e6), as.integer(20e6)))



