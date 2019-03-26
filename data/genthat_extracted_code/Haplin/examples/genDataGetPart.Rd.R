library(Haplin)


### Name: genDataGetPart
### Title: Extracting part of genetic data.
### Aliases: genDataGetPart

### ** Examples

  # The argument 'overwrite' is set to TRUE!
  # Read the data:
  examples.dir <- system.file( "extdata", package = "Haplin" )
  example.file <- paste0( examples.dir, "/HAPLIN.trialdata2.txt" )
  my.gen.data.read <- genDataRead( file.in = example.file, file.out = "trial_data",
   dir.out = ".", format = "haplin", allele.sep = "", n.vars = 2, cov.header = 
   c( "smoking", "sex" ), overwrite = TRUE )
  my.gen.data.read
  # Extract part with only men:
  men.subset <- genDataGetPart( my.gen.data.read, design = "triad", sex = 1,
    dir.out = ".", file.out = "gen_data_men_only", overwrite = TRUE )
  men.subset
  # Extract the part with only smoking women:
  women.smoke.subset <- genDataGetPart( my.gen.data.read, design = "triad",
    sex = 0, smoking = c( 1,2 ), overwrite = TRUE )
  women.smoke.subset 




