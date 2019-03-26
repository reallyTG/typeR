library(SARP.compo)


### Name: poteries
### Title: Composition of Roman poteries
### Aliases: poteries
### Keywords: datasets

### ** Examples

  data( poteries )
  # Reconstruct the car version of this dataset
  dcar <- poteries[ , c( 'Al', 'Fe', 'Mg', 'Ca', 'Na', 'Site' ) ]
  dcar <- droplevels( dcar[ -which( dcar$Site == "College of Art" ), c( 6, 1:5 ) ] )
  levels( dcar$Site )[ c( 1, 3, 4 ) ] <- c( "AshleyRails", "Islethorns", "Llanedyrn" )

  # Reconstruct the DASL version of this dataset
  ddasl <- dcar[ , c( 2:6, 1 ) ]
  levels( ddasl$Site ) <- c( 'A', 'C', 'I', 'L' )



