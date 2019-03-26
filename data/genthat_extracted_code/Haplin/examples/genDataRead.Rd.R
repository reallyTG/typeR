library(Haplin)


### Name: genDataRead
### Title: Reading the genetic data from a file
### Aliases: genDataRead

### ** Examples

  # The argument 'overwrite' is set to TRUE!
  examples.dir <- system.file( "extdata", package = "Haplin" )
  # ped format:
  example.file2 <- paste0( examples.dir, "/exmpl_data.ped" )
  ped.data.read <- genDataRead( example.file2, file.out = "exmpl_ped_data", 
   format = "ped", overwrite = TRUE )
  ped.data.read
  # haplin format:
  example.file1 <- paste0( examples.dir, "/HAPLIN.trialdata2.txt" )
  haplin.data.read <- genDataRead( file.in = example.file1, dir.out = ".",
   file.out = "exmpl_haplin_data", format = "haplin", allele.sep = "", n.vars = 2, 
   cov.header = c( "smoking", "sex" ), overwrite = TRUE )
  haplin.data.read




