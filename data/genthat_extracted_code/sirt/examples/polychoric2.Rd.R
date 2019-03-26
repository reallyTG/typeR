library(sirt)


### Name: polychoric2
### Title: Polychoric Correlation
### Aliases: polychoric2
### Keywords: Polychoric correlation Tetrachoric correlation

### ** Examples

#############################################################################
# EXAMPLE 1: data.Students | activity scale
#############################################################################

data(data.Students, package="CDM")
dat <- data.Students[, paste0("act", 1:5 ) ]

# tetrachoric correlation from psych package
library(psych)
t0 <- psych::polychoric( dat )$rho
# Olsson method (maximum likelihood estimation)
t1 <- sirt::polychoric2( dat )$rho
# maximum absolute difference
max( abs( t0 - t1 ) )
  ##   [1] 0.006914892



