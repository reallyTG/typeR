library(ctl)


### Name: CTLprofiles
### Title: CTLprofiles - Extract CTL interaction profiles
### Aliases: CTLprofiles
### Keywords: methods

### ** Examples

  library(ctl)         # Load CTL library
  data(ath.result)     # Arabidopsis Thaliana results
  p2m_matrix <- CTLprofiles(ath.result, against="markers")
  p2p_matrix <- CTLprofiles(ath.result, against="phenotypes")



