library(Rgb)


### Name: Annotation
### Title: Annotation track constructors
### Aliases: Annotation track.table.GTF track.exons.CCDS track.CNV.DGV
###   track.genes.NCBI track.bands.UCSC

### ** Examples

  # From the "How-to" vignette, section "Custom annotation tracks"
  file <- system.file("extdata/Cosmic_ATM.gtf.gz", package="Rgb")
  tt <- track.table.GTF(file)



