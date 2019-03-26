library(visualFields)


### Name: bebie
### Title: Bebie curve
### Aliases: bebie

### ** Examples

  # conventional "Bebie" rank TD curve
  td <- tdval( vf91016right[15,] )
  tdr <- tdrank( td )
  bebie( tdr )
  
  # "ghrank" type of "Bebie" rank TD curve
  td  <- tdval( vf91016right[15,] )
  tdr <- tdrank( td )
  ghr <- ghranktd( td )
  bebie( ghr, type = "ghrank" )



