library(popEpi)


### Name: as.data.frame.ratetable
### Title: Coerce a 'ratetable' Object to Class 'data.frame'
### Aliases: as.data.frame.ratetable

### ** Examples

if (requireNamespace("relsurv", quietly = TRUE)) {
  data(slopop, package = "relsurv")
  df <- as.data.frame(slopop)
  head(df)
}



