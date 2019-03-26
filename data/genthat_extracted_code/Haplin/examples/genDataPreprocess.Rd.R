library(Haplin)


### Name: genDataPreprocess
### Title: Pre-processing of the genetic data
### Aliases: genDataPreprocess

### ** Examples

  # The argument 'overwrite' is set to TRUE!
  # First, read the data:
  examples.dir <- system.file( "extdata", package = "Haplin" )
  example.file <- paste0( examples.dir, "/exmpl_data.ped" )
  ped.data.read <- genDataRead( example.file, file.out = "exmpl_ped_data", 
   format = "ped", overwrite = TRUE )
  ped.data.read
  # Take only part of the data (if needed)
  ped.data.part <- genDataGetPart( ped.data.read, design = "triad", markers = 10:12,
   file.out = "exmpl_ped_data_part", overwrite = TRUE )
  # Preprocess as "triad" data:
  ped.data.preproc <- genDataPreprocess( ped.data.part, design = "triad",
   file.out = "exmpl_data_preproc", overwrite = TRUE )
  ped.data.preproc




