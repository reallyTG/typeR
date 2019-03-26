library(Rgb)


### Name: track-constructors
### Title: Track constructors
### Aliases: track-constructors track.table track.bam track.genes
###   track.bands track.exons track.CNV

### ** Examples

  # track.table from a data.frame
  df <- data.frame(
    chrom=1, strand="+", start=1:5, end=2:6, name=letters[1:5],
    stringsAsFactors=FALSE
  )
  track.table(df)
  
  # track.table from vectors
  track.table(chrom=1, strand="+", start=1:5, end=2:6, name=letters[1:5])
  
  # track.bam
  track.bam(system.file("extdata/ATM.bam", package="Rgb"))



