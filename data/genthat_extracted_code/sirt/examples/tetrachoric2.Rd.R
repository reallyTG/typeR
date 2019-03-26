library(sirt)


### Name: tetrachoric2
### Title: Tetrachoric Correlation Matrix
### Aliases: tetrachoric2
### Keywords: Tetrachoric correlation

### ** Examples

#############################################################################
# EXAMPLE 1: data.read
#############################################################################

data(data.read)

# tetrachoric correlation from psych package
library(psych)
t0 <- psych::tetrachoric( data.read )$rho
# Olsson method (maximum likelihood estimation)
t1 <- sirt::tetrachoric2( data.read )$rho
# Divgi method
t2 <- sirt::tetrachoric2( data.read, method="Di"  )$rho
# Tucker method
t3 <- sirt::tetrachoric2( data.read, method="Tu" )$rho
# Bonett method
t4 <- sirt::tetrachoric2( data.read, method="Bo" )$rho

# maximum absolute deviation ML method
max( abs( t0 - t1 ) )
  ##   [1] 0.008224986
# mean absolute deviation Divgi method
max( abs( t0 - t2 ) )
  ##   [1] 0.1766688
# mean absolute deviation Tucker method
max( abs( t0 - t3 ) )
  ##   [1] 0.1766292
# mean absolute deviation Bonett method
max( abs( t0 - t4 ) )
  ##   [1] 0.05695522



