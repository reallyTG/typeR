library(glycanr)


### Name: quantilenorm
### Title: Quantile Normalization of glycan data
### Aliases: quantilenorm

### ** Examples

data(mpiu)
if(requireNamespace("preprocessCore", quietly=TRUE)){
  mpiun <- quantilenorm(mpiu)
  head(mpiun)

  # transpose (change) subjects and measurements
  mpiunt <- quantilenorm(mpiu, transpose=TRUE)
  head(mpiunt)
}



