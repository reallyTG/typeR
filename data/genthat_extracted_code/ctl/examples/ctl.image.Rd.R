library(ctl)


### Name: image.CTLobject
### Title: Plot genome-wide CTL on multiple traits
### Aliases: image.CTLobject
### Keywords: hplot

### ** Examples

  library(ctl)
  data(ath.result)       # Arabidopsis Thaliana results
  #Phenotype to phenotype matrix
  p2p_matrix <- image(ath.result, against="phenotypes")
  #Phenotype to marker matrix
  p2m_matrix <- image(ath.result, against="markers")



