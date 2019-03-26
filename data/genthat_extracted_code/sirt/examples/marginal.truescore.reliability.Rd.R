library(sirt)


### Name: marginal.truescore.reliability
### Title: True-Score Reliability for Dichotomous Data
### Aliases: marginal.truescore.reliability
### Keywords: Reliability

### ** Examples

#############################################################################
# EXAMPLE 1: Dimitrov (2003) Table 1 - 2PL model
#############################################################################

# item discriminations
a <- 1.7*c(0.449,0.402,0.232,0.240,0.610,0.551,0.371,0.321,0.403,0.434,0.459,
    0.410,0.302,0.343,0.225,0.215,0.487,0.608,0.341,0.465)
# item difficulties
b <- c( -2.554,-2.161,-1.551,-1.226,-0.127,-0.855,-0.568,-0.277,-0.017,
    0.294,0.532,0.773,1.004,1.250,1.562,1.385,2.312,2.650,2.712,3.000 )

marginal.truescore.reliability( b=b, a=a )
  ##   Reliability=0.606

#############################################################################
# EXAMPLE 2: Dimitrov (2003) Table 2
#  3PL model: Poetry items (4 items)
#############################################################################

# slopes, difficulties and guessing parameters
a <- 1.7*c(1.169,0.724,0.554,0.706 )
b <- c(0.468,-1.541,-0.042,0.698 )
c <- c(0.159,0.211,0.197,0.177 )

res <- sirt::marginal.truescore.reliability( b=b, a=a, c=c)
  ##   Reliability=0.403
  ##   > round( res$item, 3 )
  ##     item    pi sig2.tau sig2.error rel.item
  ##   1    1 0.463    0.063      0.186    0.252
  ##   2    2 0.855    0.017      0.107    0.135
  ##   3    3 0.605    0.026      0.213    0.107
  ##   4    4 0.459    0.032      0.216    0.130

#############################################################################
# EXAMPLE 3: Reading Data
#############################################################################
data( data.read)

#***
# Model 1: 1PL
mod <- sirt::rasch.mml2( data.read )
marginal.truescore.reliability( b=mod$item$b )
  ##   Reliability=0.653

#***
# Model 2: 2PL
mod <- sirt::rasch.mml2( data.read, est.a=1:12 )
marginal.truescore.reliability( b=mod$item$b, a=mod$item$a)
  ##   Reliability=0.696

## Not run: 
##D # compare results with Cronbach's alpha and McDonald's omega
##D # posing a 'wrong model' for normally distributed data
##D library(psych)
##D psych::omega(dat, nfactors=1)     # 1 factor
##D   ##  Omega_h for 1 factor is not meaningful, just omega_t
##D   ##   Omega
##D   ##   Call: omega(m=dat, nfactors=1)
##D   ##   Alpha:                 0.69
##D   ##   G.6:                   0.7
##D   ##   Omega Hierarchical:    0.66
##D   ##   Omega H asymptotic:    0.95
##D   ##   Omega Total            0.69
##D 
##D ##! Note that alpha in psych is the standardized one.
## End(Not run)



