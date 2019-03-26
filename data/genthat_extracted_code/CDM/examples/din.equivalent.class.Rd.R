library(CDM)


### Name: din.equivalent.class
### Title: Calculation of Equivalent Skill Classes in the DINA/DINO Model
### Aliases: din.equivalent.class
### Keywords: DINA DINO Equivalent skill classes

### ** Examples

#############################################################################
# EXAMPLE 1: Equivalency classes for DINA model for fraction subtraction data
#############################################################################

#-- DINA models

data(data.fraction2, package="CDM")

# first Q-matrix
Q1 <- data.fraction2$q.matrix1
m1 <- CDM::din.equivalent.class( q.matrix=Q1, rule="DINA" )
  ## 8 Skill classes | 5  distinguishable skill classes | Gini coefficient=0.3

# second Q-matrix
Q1 <- data.fraction2$q.matrix2
m1 <- CDM::din.equivalent.class( q.matrix=Q1, rule="DINA" )
  ## 32 Skill classes | 9  distinguishable skill classes | Gini coefficient=0.5

# third Q-matrix
Q1 <- data.fraction2$q.matrix3
m1 <- CDM::din.equivalent.class( q.matrix=Q1, rule="DINA" )
  ## 8 Skill classes | 8  distinguishable skill classes | Gini coefficient=0

# original fraction subtraction data
m1 <- CDM::din.equivalent.class( q.matrix=CDM::fraction.subtraction.qmatrix, rule="DINA")
  ## 256 Skill classes | 58  distinguishable skill classes | Gini coefficient=0.659



